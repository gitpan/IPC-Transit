
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A framework for high performance message passing",
  "AUTHOR" => "Dana M. Diederich <dana\@realms.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "IPC-Transit",
  "EXE_FILES" => [
    "bin/qtrans",
    "bin/remote-transit-gateway",
    "bin/remote-transitd",
    "bin/rtrans",
    "bin/strans",
    "bin/qtrans",
    "bin/remote-transit-gateway",
    "bin/remote-transitd",
    "bin/rtrans",
    "bin/strans"
  ],
  "LICENSE" => "perl",
  "NAME" => "IPC::Transit",
  "PREREQ_PM" => {
    "Data::Dumper" => 0,
    "File::Slurp" => 0,
    "Getopt::Std" => 0,
    "HTTP::Lite" => 0,
    "HTTP::Server::Simple::CGI" => 0,
    "IPC::Msg" => 0,
    "IPC::SysV" => 0,
    "JSON" => 0,
    "POE" => 0,
    "POSIX" => 0,
    "Storable" => 0,
    "base" => 0,
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "English" => 0,
    "File::Spec" => 0,
    "Test::More" => 0,
    "Test::Perl::Critic" => 0,
    "Test::Perl::Critic::Progressive" => 0,
    "Test::PerlTidy" => 0,
    "lib" => 0
  },
  "VERSION" => "1.133280",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



