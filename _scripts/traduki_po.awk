{
  if ( CONTMSG==1 && substr($1,1,1) != "\"")
  {
    CONTMSG=0;
  }
  if ($2 == "fuzzy")
  {
    FUZZY=1;
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
      getline
      if ( substr($1,1,1) == "\"")
      { # plurlinia mesaĝo
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
      else
      {
        if(FUZZY ==0)
          print ("#, fuzzy");
        print ("msgid " MSGID);
        printf("msgstr ");
          split(MSGID,MSGS,"__| _|_ |_|  \\\\n|\\\\n|**|\n|!|\\[|\\]|\\(|\\||\\\"|\"|\\\\|\\)|\\(",SEPS);
          for (x=1 ; x<=length(MSGS) ; x++)
          {
            if(match(MSGS[x],"[[:alpha:]]")==0 )
            {
              printf(MSGS[x]);
            }
            else if(MSGS[x] != "")
            {
              #printf("\nMSG=system("BASEDIR"/traduko.sh " src " " dst " \"" MSGS[x] "\"" ")\n");
              MSG=system(BASEDIR"/traduko.sh " src " " dst " \"" MSGS[x] "\"" )
            }
            printf( SEPS[ x ] );
            if(SEPS[ x ] == "(")
            {
              do
              {
                x++;
                printf(MSGS[x] SEPS[x]);
              }
              while( x<=length(MSGS) && SEPS[x] != ")");
            }
            if(SEPS[ x ] == " _")
            {
              do
              {
                x++;
                printf(MSGS[x] SEPS[x]);
              }
              while( x<=length(MSGS) && SEPS[x] != "_ " && SEPS[x] != "_");
            }
          }
        print;
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
  else
  {
    print $0;
  }
}
