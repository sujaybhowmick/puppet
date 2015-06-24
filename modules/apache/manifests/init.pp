class apache {
    # CentOS v.5 only
    case  $operatingsystem { 
     "CentOS":  { 
        $wantedpackages = [ "httpd","php","php-mysql","php-mcrypt","php-mhash","php-mbstring" ]
        package { $wantedpackages: 
                  ensure => installed 
        }
        service { "httpd":
                ensure => running,
                hasstatus => true,
                hasrestart => true,
                require => Package["httpd"],
                restart => true;
        }
      } 
 
    "Debian": { 
        # assume Debian base..
        $wantedpackages = [ "apache2" ]
        package { $wantedpackages: 
                  ensure => installed 
        }
 
        service { "apache2":
                hasstatus => true,
                hasrestart => true,
                ensure => running,
                require => Package["apache2"]
        }
    } 
  } # end case
}
