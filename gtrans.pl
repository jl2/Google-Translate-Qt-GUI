#!/usr/bin/perl

use strict;
use warnings;

require LWP::UserAgent;
use Getopt::Long qw(:config pass_through);
use URI::Escape;
use HTML::Entities;

my %languages = ('french'=>'fr', 'spanish'=>'es', 'afrikaans'=>'af', 'albanian'=>'sq',
'arabic'=>'ar', 'belarusian'=>'be', 'bulgarian'=>'bg', 'catalan'=>'ca', 'chinese'=>'zh-cn',
'croatian'=>'hr', 'czech'=>'cs', 'danish'=>'da', 'dutch'=>'nl', 'english'=>'en', 'estonian'=>'et',
'filipino'=>'tl', 'finnish'=>'fi', 'french'=>'fr', 'galician'=>'gl', 'german'=>'de', 'greek'=>'el',
'haitian creole alpha'=>'ht', 'hebrew'=>'iw', 'hindi'=>'hi', 'hungarian'=>'hu', 'icelandic'=>'is',
'indonesian'=>'id', 'irish'=>'ga', 'italian'=>'it', 'japanese'=>'ja', 'korean'=>'ko',
'latvian'=>'lv', 'lithuanian'=>'lt', 'macedonian'=>'mk', 'malay'=>'ms', 'maltese'=>'mt',
'norwegian'=>'no', 'persian'=>'fa', 'polish'=>'pl', 'portuguese'=>'pt', 'romanian'=>'ro',
'russian'=>'ru', 'serbian'=>'sr', 'slovak'=>'sk', 'slovenian'=>'sl', 'spanish'=>'es',
'swahili'=>'sw', 'swedish'=>'sv', 'thai'=>'th', 'turkish'=>'tr', 'ukrainian'=>'uk',
'vietnamese'=>'vi', 'welsh'=>'cy', 'yiddish'=>'yi', );

sub usage {
    my $usage_str = <<END;

Valid command line arguments are:

   $0  [--to <language>] [--from <language>] text...

Optional arguments controlling translation languages:

   --to     Sets the language to translate to
            The default value is English (en)

   --from   Sets the language to translate from
            The default value is French (fr)

Languages can be specified by name (i.e. French) or by their abbreviation (i.e. fr).

Valid languages are:

END
    print $usage_str;
    my $curLine = '';
    
    for my $key (sort keys %languages) {
        $curLine = sprintf('%s %20s %7s  ', $curLine, $key, '('.$languages{$key}.')');
        if (length($curLine)>100) {
            print "$curLine\n";
            $curLine = '';
        }
    }
    print "$curLine\n";
}

sub main {
    my $help;
    my $to = 'en';
    my $from = 'fr';
    
    GetOptions('help!'=>\$help,
               'to=s'=>\$to,
               'from=s'=>\$from);

    if ($help || $#ARGV==-1) {
        usage;
        exit(0);
    }

    if ($languages{lc $from}) {
        $from = $languages{lc $from};
    }
    if ($languages{lc $to}) {
        $to = $languages{lc $to};
    }

    my @words = @ARGV;
    map uri_escape, @words;
    my $url = "http://translate.google.com/translate_t?langpair=$from|$to&text=" . join('+', @words);

    my $ua = LWP::UserAgent->new;
    $ua->agent('');

    my $res = $ua->get($url);
    if ($res->is_success) {
        if ($res->content =~ /<textarea name=utrans wrap=SOFT dir="ltr" id=suggestion style="width:80%;margin:5px 0;overflow:auto">(.*?)<\/textarea>/) {
            my $translated = decode_entities($1);
            print "$translated\n";
        }
    }
    else {
        die $res->status_line;
    }
}

main;
