
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
        if ( match(cvalue, /^[+-]?[0-9]+(\.[0-9]*)?([Ee][+-][0-9]+)?$/ ) ) {
            printf("<table:table-cell office:value-type=\"float\" office:value=\"%s\">", cvalue);
        } else {
            printf("<table:table-cell office:value-type=\"string\">");
        }
        printf("<text:p>%s</text:p>", cvalue)
        printf("</table:table-cell>\n");
    }
    printf("</table:table-row>\n");
}

END {
    printf("</table:table>\n");
}

