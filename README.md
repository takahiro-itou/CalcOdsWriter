# LibraCalc の .ods 形式ファイルを生成する

##  テンプレートの使い方

1.  content.header.xml, content.body.xml, content.footer.xml を
    この順序で連結し content.xml  という名前で保存する。
2.  出来上がった content.xml に、
    もとから用意された style.xml と META-INF/ の中身を zip  圧縮する。
    拡張子は .ods にしておく。

```
cat content.header.xml content.body.xml content.footer.xml > contnet.xml
zip Test.ods  META-INF/ styles.xml  content.xml
```

後はプログラムを用いて content.xml  の中身を生成することができれば、
内容は適当に書き換えることができる。

以上
