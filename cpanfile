requires 'perl', '5.008005';

requires 'Data::Printer';
requires 'Devel::REPL::Plugin';

on test => sub {
    requires 'Test::More', '0.88';
};
