class String::Dump;

has $.format;
has $.separator;

submethod BUILD (Str $mode?, Str :$format = '%X', Str :$separator = ' ') {
    $!format = do given $mode {
        when 'hex' { '%X' }
        when 'dec' { '%d' }
        when 'oct' { '%o' }
        when 'bin' { '%b' }
        default { $format }
    }

    $!separator = $separator;
}

method dump (Str $str) {
    return dumpstr($str, $.format, $.separator);
}

sub dump-hex (Str $str) is export {
    return dumpstr($str, '%X');
}

sub dump-dec (Str $str) is export {
    return dumpstr($str, '%d');
}

sub dump-oct (Str $str) is export {
    return dumpstr($str, '%o');
}

sub dump-bin (Str $str) is export {
    return dumpstr($str, '%b');
}

sub dumpstr (Str $str, Str $format, Str $separator = ' ') {
    return $str.comb».ord.fmt($format, $separator);
}
