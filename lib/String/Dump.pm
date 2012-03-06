module String::Dump;

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

sub dumpstr (Str $str, Str $fmt) {
    return $str.comb».ord.fmt($fmt);
}
