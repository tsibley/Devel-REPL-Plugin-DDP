package Devel::REPL::Plugin::DDP;

use strict;
use 5.008_005;
our $VERSION = '0.02';

use Devel::REPL::Plugin;
use Data::Printer;

around 'format_result' => sub {
    my $orig = shift;
    my $self = shift;
    my @to_dump = @_;
    my $out;
    if (@to_dump != 1 || ref $to_dump[0]) {
        if (@to_dump == 1 && overload::Method($to_dump[0], '""')) {
            $out = "@to_dump";
        } else {
            p(@to_dump,
              output        => \$out,
              colored       => 1,
              caller_info   => 0 );
        }
    } else {
        $out = $to_dump[0];
    }
    $self->$orig($out);
};

1;

__END__

=encoding utf-8

=head1 NAME

Devel::REPL::Plugin::DDP - Format return values with Data::Printer

=head1 DESCRIPTION

Use this in your Devel::REPL profile or load it from your C<re.pl> script.

You'll also want to make sure your profile or script runs the following:

    $_REPL->normal_color("reset");

or disables the L<standard Colors plugin|Devel::REPL::Plugin::Colors>.

=head1 AUTHOR

Thomas Sibley E<lt>tsibley@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2013- Thomas Sibley

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
