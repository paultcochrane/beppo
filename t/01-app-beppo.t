use v6;

use Test;
use lib 'lib';

plan 6;

use-ok 'App::beppo';
use App::beppo;

subtest {
    plan 7;

    my $beppo = App::beppo.new;
    ok $beppo.start-date, "application has a start date";
    ok $beppo.end-date, "application has an end date";

    ok $beppo.start-date ~~ (Date), "start date is a Date";
    ok $beppo.end-date ~~ (Date), "end date is a Date";

    ok $beppo.base-search-dir, "application has a base search directory";
    ok $beppo.base-search-dir ~~ (IO::Path), "base search dir is an IO::Path";

    is $beppo.author-name, "", "author name attribute default value";
}, "default attribute values";

subtest {
    plan 5;

    my $start-date = '2014-06-03';
    my $end-date = '2015-06-03';
    ok App::beppo.new(:$start-date, :$end-date),
        "application accepts start and end dates";

    my $beppo = App::beppo.new(start-date => '2014-01-01',
                               end-date => '2014-06-30');
    is $beppo.start-date, Date.new('2014-01-01'),
        "start date set correctly";
    is $beppo.end-date, Date.new('2014-06-30'),
        "end date set correctly";
    ok $beppo.start-date ~~ (Date), "start date from arg is Date";
    ok $beppo.end-date ~~ (Date), "end date from arg is Date";
}, "setting start and end date values";

subtest {
    plan 3;

    ok App::beppo.new(base-search-dir => "/tmp"),
        "application accepts base search dir argument";

    my $beppo = App::beppo.new(base-search-dir => "/tmp");
    is $beppo.base-search-dir, "/tmp".IO, "base search dir set correctly";
    ok $beppo.base-search-dir ~~ (IO::Path), "base search dir is an IO::Path";
}, "set base-search-dir value";

subtest {
    plan 2;

    ok App::beppo.new(author-name => 'Joe Bloggs'),
        "application accepts author name argument";

    my $beppo = App::beppo.new(author-name => 'Joe Bloggs');
    is $beppo.author-name, "Joe Bloggs", "author name set correctly";

}, "set author-name value";

subtest {
    plan 1;

    my $test-dir = "/tmp/beppo";
    mkdir $test-dir;

    my $beppo = App::beppo.new(base-search-dir => $test-dir);
    my @repo-list = $beppo.find-git-repos;
    is @repo-list.elems, 0, "No repos found in empty search path";

    qqx{rm -r $test-dir};
}

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
