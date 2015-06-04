use v6;

class App::beppo {
    has $.start-date;
    has $.end-date;
    has $.base-search-dir;
    has $.author-name;

    submethod BUILD(:$start-date, :$end-date, :$base-search-dir, :$author-name) {
        $!start-date = $start-date ?? Date.new($start-date)
                                   !! Date.today.earlier(years => 1);
        $!end-date = $end-date ?? Date.new($end-date)
                               !! Date.today;
        $!base-search-dir = $base-search-dir ?? $base-search-dir.IO
                                             !! $*HOME;
        $!author-name = $author-name ?? $author-name !! "";
    }

    method run {
        my @repo-list = self.find-git-repos;
        return True;
    }

    method find-git-repos {
        return ();
    }
}

# vim: expandtab shiftwidth=4 ft=perl6
