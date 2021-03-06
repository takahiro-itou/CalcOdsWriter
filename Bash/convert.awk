
BEGIN {
    printf("<table:table table:name=\"%s\">\n", tablename);
}

{
    printf("<table:table-row>\n");
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

