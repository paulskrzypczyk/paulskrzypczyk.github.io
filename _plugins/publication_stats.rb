# -----------------------------------------------------------------------------
# Publication statistics
#
# Reads the jekyll-scholar bibliography (_bibliography/papers.bib) at build time
# and exposes summary counts to Liquid as `site.data.publication_stats`.
# Rendered at the top of the Publications page by _includes/publication_stats.html.
#
# Classification rules:
#   @book                              -> book
#   journal starting with "arXiv"      -> preprint (not counted as published)
#   any other @article                 -> published journal article
#   highlight containing "Review"      -> also counted as a review article
#
# Journal names are normalised with JOURNAL_ALIASES so that small spelling
# differences in the .bib file don't split a journal into two rows.
# -----------------------------------------------------------------------------
require "bibtex"

module Jekyll
  class PublicationStatsGenerator < Generator
    safe true
    priority :high

    JOURNAL_ALIASES = {
      "Phys. Rev. Lett"     => "Phys. Rev. Lett.",
      "Phys. Rev. Res."     => "Phys. Rev. Research",
      "Nat. Commun."        => "Nature Commun.",
      "Nature Communications" => "Nature Commun.",
      "J. Phys. A"          => "J. Phys. A: Math. Theor.",
    }.freeze

    def generate(site)
      scholar = site.config["scholar"] || {}
      dir  = (scholar["source"] || "_bibliography").sub(%r{\A/}, "")
      file = scholar["bibliography"] || "papers.bib"
      path = File.join(site.source, dir, file)
      unless File.exist?(path)
        Jekyll.logger.warn "PublicationStats:", "bibliography not found at #{path}"
        return
      end

      bib = BibTeX.open(path, :strict => false)

      articles = 0
      reviews = 0
      books = 0
      preprints = 0
      journals = Hash.new(0)
      years = Hash.new(0)

      bib.each do |entry|
        next unless entry.respond_to?(:type)
        type    = entry.type.to_s.downcase
        journal = entry[:journal].to_s.gsub(/\s+/, " ").strip
        year    = entry[:year].to_s.strip.to_i

        if type == "book"
          books += 1
          years[year] += 1 if year > 0
        elsif type == "article"
          if journal =~ /\Aarxiv/i
            preprints += 1
          else
            articles += 1
            reviews += 1 if entry[:highlight].to_s =~ /review/i
            name = JOURNAL_ALIASES.fetch(journal, journal)
            journals[name] += 1 unless name.empty?
            years[year] += 1 if year > 0
          end
        end
      end

      sorted_journals = journals.sort_by { |name, n| [-n, name] }
                                .map { |name, n| { "name" => name, "count" => n } }

      year_list = []
      unless years.empty?
        (years.keys.min..years.keys.max).each do |y|
          year_list << { "year" => y, "count" => years[y] }
        end
      end

      site.data["publication_stats"] = {
        "articles"     => articles,
        "reviews"      => reviews,
        "books"        => books,
        "preprints"    => preprints,
        "total"        => articles + books,
        "n_journals"   => sorted_journals.size,
        "journals"     => sorted_journals,
        "max_journal"  => sorted_journals.map { |j| j["count"] }.max || 0,
        "years"        => year_list,
        "max_per_year" => year_list.map { |y| y["count"] }.max || 0,
        "first_year"   => year_list.first && year_list.first["year"],
        "last_year"    => year_list.last && year_list.last["year"],
      }
    end
  end
end
