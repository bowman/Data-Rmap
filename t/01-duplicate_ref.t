use Test::More tests => 1;

use Data::Rmap;

my $href = [];

my $struct = {
    foo => $href,
    bar => $href,
};

rmap_all { $_ = 123 if 'ARRAY' eq ref } $struct;

is_deeply(
    $struct,
    { foo => 123, bar => 123 },
    'duplicate occurrence of the same reference is processed if the first value changes',
);
