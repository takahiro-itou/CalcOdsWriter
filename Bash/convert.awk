
BEGIN {
    printf("<table:table table:name=\"%s\" table:style-name=\"ta1\">\n",
           tablename);
    printf("<table:table-column table:style-name=\"co1\"");
    printf(" table:default-cell-style-name=\"Default\"/>\n");

    printf("<table:table-column table:style-name=\"co2\"");
    printf(" table:default-cell-style-name=\"ce1\"/>\n");

    printf("<table:table-column table:style-name=\"co2\"");
    printf(" table:default-cell-style-name=\"Default\"/>\n");
}

{
    printf("<table:table-row table:style-name=\"ro1\">\n");
    for ( c = 1; c <= NF; ++ c ) {
        cvalue = $c;
        printf("<table:table-cell");
        if ( match(cvalue, /^[+-]?[0-9]+(\.[0-9]*)?([Ee][+-][0-9]+)?$/ ) ) {
            printf(" office:value-type=\"float\" office:value=\"%s\"", cvalue);
            printf(" calcext:value-type=\"float\"");
        } else {
            printf(" office:value-type=\"string\"");
            printf(" calcext:value-type=\"string\"");
        }
        printf(">");
        printf("<text:p>%s</text:p>", cvalue)
        printf("</table:table-cell>\n");
    }
    printf("</table:table-row>\n");
}

END {
    printf("</table:table>\n");
}

