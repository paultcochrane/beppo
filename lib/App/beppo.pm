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
        say "Finding git repos under $!base-search-dir";
        say "This can take a while; please be patient";
        my $find-command = "find $!base-search-dir -name '.git'";
        my $find-output = qqx{$find-command}.chomp;
        my @repo-list = $find-output
            ?? gather for $find-output.split(/\s+/) -> $dir {
                take $dir.IO.dirname;
            }
            !! ();

        return @repo-list.sort;
    }
}

# vim: expandtab shiftwidth=4 ft=perl6
