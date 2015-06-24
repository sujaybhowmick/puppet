class phpwithapache{
        package {'apache2':
                ensure => present,
        }

        file { '/etc/apache2/mods-enabled/userdir.load':
                ensure => 'link',
                target => '/etc/apache2/mods-available/userdir.load',
                notify => Service["apache2"],
                require => Package["apache2"],
        }

        file { '/etc/apache2/mods-enabled/userdir.conf':
                ensure => 'link',
                target => '/etc/apache2/mods-available/userdir.conf',
                notify => Service["apache2"],
                require => Package["apache2"],
        }

        package {'libapache2-mod-php5':
                ensure => present,
        }

        file {'/etc/apache2/mods-available/php5.conf':
                content => template("phpwithapache/php5.conf.erb"),
                require => Package["apache2"],
                notify => Service["apache2"],
        }

        service {'apache2':
                ensure => "running",
                enable => "true",
                require => Package["apache2"],
        }
}