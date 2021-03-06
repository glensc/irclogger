# do your own actions here
#
# Params are Net::IRC, msg, user

sub special($$$) {
    my $irc  = shift;
    my $msg  = shift;
    my $nick = shift;
    $mynick = $conf{'irc_nick'};

    if($msg =~ m/\bFS#(\d\d+)\b/){
        $irc->privmsg($conf{'irc_chan'}, "See bugreport $1 at http://bugs.dokuwiki.org/index.php?do=details&task_id=$1");
    }elsif($msg =~ m/(^|\s)(\w*:\w+(:\w+)*)(\s|$)/){
        my $id = $2;
    $id =~ s/^://;
    $id = lc($id);
    $p  = $id;
    $p  =~ s/:/\//g;
    if( -e "/var/www/wiki/htdocs/data/pages/$p.txt"){
            $irc->privmsg($conf{'irc_chan'}, 'http://www.dokuwiki.org/'.$id);
    }
#    }elsif($msg =~ m/(\[\[)([:\w]+)(\]\])/){
#        $irc->privmsg($conf{'irc_chan'}, 'http://www.dokuwiki.org/'.$2);
    }elsif($msg =~ m/\bUGT\b/){
        $irc->privmsg($conf{'irc_chan'}, 'UGT - Universal Greeting Time http://www.total-knowledge.com/~ilya/mips/ugt.html'.$1);
    }elsif(length($msg) < 50 and  $msg =~ m/((have|got|ask).*?(question))|((can|may) I ask )/i){
        $irc->privmsg($conf{'irc_chan'}, $nick.', just ask your question and stay in the channel for a while.');
    }elsif($msg =~ m/\bgame\b/i){
        $irc->privmsg($conf{'irc_chan'}, '$nick, you just lost the game!');
    }elsif($msg =~ m/$mynick/){
        if($msg =~ m/\b(thanks?|thx)\b/i){
            $irc->privmsg($conf{'irc_chan'}, "$nick, I'm just a humble bot, don't thank me.");
        }elsif($msg =~ m/\b(hug|love|kiss)/i){
            $irc->privmsg($conf{'irc_chan'}, "$nick, I'm just a stupid bot, but your kindness makes me wish to be human.");
        }elsif($msg =~ m/\bcoffee\b/i){
            $irc->privmsg($conf{'irc_chan'}, "$nick, here's the hot, steamy coffee you ordered.");
        }elsif($msg =~ m/\btea\b/i){
            $irc->privmsg($conf{'irc_chan'}, "$nick, your tea is ready my dear.");
        }elsif($msg =~ m/\bjolt\b/i){
            if($nick eq 'foosel'){
                $irc->privmsg($conf{'irc_chan'}, "$nick, here is your ice cold Jolt, my lady.");
            }else{
                $irc->privmsg($conf{'irc_chan'}, "$nick, here is your ice cold Jolt. May I recommend to drink it quick, before foosel grabs it?");
            }
        }elsif($msg =~ m/\bbeer\b/i){
            if($nick eq 'chimeric'){
                $irc->privmsg($conf{'irc_chan'}, "$nick, have a cool, refreshing Augustiner beer. Prost!");
            }elsif($nick eq 'selfthinker'){
                $irc->privmsg($conf{'irc_chan'}, "$nick, have a cool, refreshing ginger beer. Cheers, mate!");
            }else{
                $irc->privmsg($conf{'irc_chan'}, "$nick, have a cool, refreshing beer, you've earned it.");
            }
        }elsif($msg =~ m/\bwine\b/i){
            $irc->privmsg($conf{'irc_chan'}, "$nick, please enjoy your glass of wine.");
        }elsif($msg =~ m/\b(wh?isk(ey|y))\b/i){
            if($nick eq 'Chris--S'){
                $irc->privmsg($conf{'irc_chan'}, "$nick, here is your glass of Scotch, please enjoy the taste of your homeland.");
            }else{
                $irc->privmsg($conf{'irc_chan'}, "$nick, here is your glass of fine $1.");
            }
        }elsif($msg =~ m/\bcookies?\b/i){
            $irc->privmsg($conf{'irc_chan'}, "$nick, enjoy your cookie. I will take care of the crumbs.");
        }elsif($msg =~ m/\bcake\b/i){
            $irc->privmsg($conf{'irc_chan'}, "$nick, the cake is a lie!");
        }elsif($msg =~ m/\b(poke|tickle)s?\b/i){
            $irc->privmsg($conf{'irc_chan'}, "*giggle* $nick, please stop this. :-)");
        }elsif($msg =~ m/\bzimbot\b/i){
            $irc->privmsg($conf{'irc_chan'}, "*blush* zimbot is kinda cute.");
        }elsif($msg =~ m/\b(hi|hello|heyas|hey|good morning|good evening|welcome|wb)\b/i){
            $irc->privmsg($conf{'irc_chan'}, "Hello $nick, I'm just a humble bot but I'll try my best to serve you.");
        }
    }
}

1;
