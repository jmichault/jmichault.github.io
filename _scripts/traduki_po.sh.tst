#!/usr/bin/env sh
#################################################################
# skripto por aŭtomate traduki frazojn sen traduko en po-dosieron
#################################################################

src=eo

#FIC=locale/en/LC_MESSAGES/motioneye.po
FIC=$1
BASEDIR=`dirname $0`
dst=`grep "^\"Language: .*\\n\"$" $FIC|sed "s/^\"Language: //;s/.n\"$//"`

cat $FIC|awk -v BASEDIR=$BASEDIR -v src=$src -v dst=$dst '{
  if ( CONTMSG==1 && substr($1,1,1) != "\"")
  {
    CONTMSG=0;
  }
  if ($1 == "msgid")
  {
    MSGID=substr($0,7);
    MSGWRAP=0;
    if(MSGID=="\"\"")
    {
      CONTMSG=1;
      MSGWRAP=1;
    }
  }
  else if ( CONTMSG==1 && substr($1,1,1) == "\"")
  {
    MSGID=MSGID "\n" $0;
  }
  else if ($1 == "msgstr")
  {
    if($2 != "\"\"" || MSGID == "\"\"")
    {
      print ("msgid " MSGID);
      print $0;
    }
    else
    {
      # msgstr "" kaj MSGID != ""
      $0="";
      getline ;
      if ( substr($1,1,1) == "\"")
      { # plurlinia mesaĝo
        print ("msgid " MSGID);
        printf("msgstr \"\"\n");
	print $0;
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
      else
      {
        print ("#, fuzzy");
        print ("msgid " MSGID);
        printf("msgstr ");
printf("MSGID="MSGID"...\n");
          split(MSGID,MSGS,"\n",SEPS);
printf("MSGID="MSGID"...\n");
          for (x=1 ; x<=length(MSGS) ; x++)
          {
            if(MSGS[x]=="/"/"")
            {
              printf("\"\"\n");
              continue;
            }
	    printf("\"");
            LEN=length(MSGS[x]);
printf("LEN="LEN " ; index="index(MSGS[x],"\\n")"\n");
printf("MSGS[x]="MSGS[x]"...\n");
            if( index(MSGS[x],"  \\n") == LEN-4)
            {
	      MSG2=substr(MSGS[x],1,LEN-5)"\"";
              FIN="  \\n";
            }
            if( index(MSGS[x],"\\n") == LEN-2)
            {
	      MSG2=substr(MSGS[x],1,LEN-3) "\"";
              FIN2="\\n";
            }
            else
            {
	      MSG2=MSGS[x];
              FIN2="";
            }
printf("FIN2=" FIN2 "...");
            MSG=system(BASEDIR"/traduko.sh " src " " dst " " MSG2 )
	    printf(FIN2 "\"\n");
            #print( SEPS[ x ] );
          }
      }
      MATTER="";
      print $0;
    }
  }
  else if (substr($0,1,28) == "#. type: YAML Front Matter: ")
  {
    MATTER=substr($0,29);
    print $0;
  }
  else
  {
    print $0;
  }
}' >$FIC.$$
mv $FIC $FIC.old
mv $FIC.$$ $FIC
