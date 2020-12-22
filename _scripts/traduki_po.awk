# gawk-skripto por traduki po-dosieron el esperanto al alia lingvo
# la ideo estas prilabori MSGIDojn por kiuj la MSGSTR estas malplena.
# MSGID-oj, kiuj havas Aferon inter layout, lang-ref, lang-niv, Fenced ne estas tradukitaj.
# Ni tiam eltranĉas la tradukenda tekston por forigi la elementojn de la sintakso ~ Markdown ~
# hiperligoj, kodblokoj kaj teksto kursivigita per "_" ne estas tradukitaj.
#
# google web translate konservas la etikedon html «<q> xxx </q>».
# 
{
  if ( CONTMSG==1 && substr($1,1,1) != "\"")
  { # fino de plurlinia mesaĝo
    CONTMSG=0;
  }
  if ($2 == "fuzzy")
  {
    FUZZY=1;
  }
  if ($1 == "msgid")
  {
    MSGID=substr($0,7);
    MSGSTR=substr($0,8,length($0)-8);
    MSGWRAP=0;
    if(MSGID=="\"\"")
    {
      CONTMSG=1;
      MSGWRAP=1;
    }
  }
  else if ( CONTMSG==1 && substr($1,1,1) == "\"")
  { # daŭrigo de plurlinia mesaĝo
    # enmemorigi MSGID-liniojn
    MSGID=MSGID "\n" $0;
    # enmemorigi netradukitan mesaĝon
    MSGSTR=MSGSTR substr($0,2,length($0)-2);
  }
  else if ($1 == "msgstr")
  {
    if( ($2 != "\"\"" && $2 != "\"\\n\"") || MSGID == "\"\"")
    { # mesaĝo jam tradukita
      print ("msgid " MSGID);
      print $0;
    }
    else
    {
      # msgstr "" kaj MSGID != ""
      $0="";
      getline
      if ( substr($1,1,1) == "\"")
      { # plurlinia mesaĝo jam tradukita
        print ("msgid " MSGID);
        printf("msgstr \"\"\n");
        print $0;
        FUZZY=0;
	next;
      }
      if(MATTER == "lang")
      {
        print ("msgid " MSGID);
        printf("msgstr \"" dst "\"\n");
      }
      else if(MATTER == "layout")
      {
        print ("msgid " MSGID);
        print ("msgstr " MSGID);
      }
      else if(MATTER == "lang-ref")
      {
        print ("msgid " MSGID);
        print ("msgstr " MSGID);
      }
      else if(MATTER == "lang-niv")
      {
        print ("msgid " MSGID);
        print ("msgstr \"auto\"" );
      }
      else if(MATTER == "Fenced")
      {
        print ("msgid " MSGID);
        print ("msgstr " MSGID);
      }
      else
      { # ĉi tiu mesaĝo estas tradukenda
        if(FUZZY ==0)
          print ("#, fuzzy");
        print ("msgid " MSGID);
        printf("msgstr \"");
	#  anstataŭigi markdown-etikedojn per markoj
        split(MSGSTR,MSGS,"^[ \t]*|[ \t]*\\\\\\\\.|[ \t]*\\\\.|[ \t]*!\\[[ \t]*|[ \t]*[_\\*`<>\\[\\]\\(\\)~]+[ \t]*",SEPS);
	MSG0 = "";
        ##for (x=1 ; x<=length(MSGS) ; x++)		##
	##	print (" sep " x " : "  SEPS[x]);	##
	MSGSLEN = length(MSGS);
        for (x=1 ; x<=MSGSLEN ; x++)
        {
	  MSG0 = MSG0 MSGS[x] ;
	  ##print "x = " x;	##
	  if (SEPS[x] != "")
	  {
	    MSG0 = MSG0 "<q> xxx" x " </q>";
	    # ne traduku hiperligon, kodon, kursivigita kun "_"
	    if( match(SEPS[ x ] ,"^ *`") == 1 )
	    { # kodo : ne traduku.
	      x0 = x ;
	      do
              {
                x++;
                SEPS[x0] = SEPS[x0] MSGS[x] SEPS[x];
              }
              while( x<=MSGSLEN && ! match(SEPS[x] ,"`"));
	    }
	    else if( match(SEPS[ x ] ,"^ *_$") == 1 )
	    { # kursivigita kun "_"
	      x0 = x ;
	      do
              {
                x++;
                SEPS[x0] = SEPS[x0] MSGS[x] SEPS[x];
              } while( (x <= MSGSLEN) && (match(SEPS[x] ,"^_[ \t]*")==0));
	    }
	    else if( match(SEPS[ x ] ,"[ \t]*!?\\[[ \t]*") == 1 )
	    { # hiperligo : ne traduku.
	      x0 = x ;
	      do
              {
                x++;
                SEPS[x0] = SEPS[x0] MSGS[x] SEPS[x];
              }
              while( x<=MSGSLEN && ! match(SEPS[x] ," *\\] *"));
	      if( match(SEPS[ x ] ," *\\( *") == 1 )
	      {
	        do
                {
                  x++;
                  SEPS[x0] = SEPS[x0] MSGS[x] SEPS[x];
                }
                while( x<=MSGSLEN && ! match(SEPS[x] ," *\\) *"));
              }
	    }
	  }
	}
        ##print("\nMSG0 " MSG0);	##
        BASEDIR"/traduko.sh " src " " dst " \"" MSG0 "\"" |getline MSG
        ## print("MSG " MSG);		##
	split(MSG, MSGS2," *< *q *> xxx[0-9]+ < */ *q *> *",SEPS2);
	MSGT="";
        for (x=1 ; x<=length(MSGS2) ; x++)
	{ # anstataŭigi markoj per markdown-etikedojn
	  MSGT = MSGT MSGS2[x];
	  if (SEPS2[x] != "")
	  {
	    match(SEPS2[x],"> xxx[0-9]+");
	    x2 = substr(SEPS2[x],RSTART+5,RLENGTH-5);
	    ## print("x2=" x2);		##
	    MSGT = MSGT SEPS[x2];
          }
	}
        print(MSGT "\"");
      }
      FUZZY=0;
      MATTER="";
      print $0;
    }
  }
  else if (substr($0,1,28) == "#. type: YAML Front Matter: ")
  {
    MATTER=substr($0,29);
    print $0;
  }
  else if (substr($0,1,15) == "#. type: Fenced")
  {
    MATTER="Fenced";
    print $0;
  }
  else
  {
    print $0;
  }
}
