#TITLE=See7di.Content-type
#INFO
EditPlus Cliptext Library v1.0 written by Seven(See7di@Gmail.com).

#SORT=n

#T= 

#T= ┉ 舉個例子 ┉
<?php
//输出头部
Header('Content-type:text/xml; charset=utf-8');
$Xml='<?xml version="1.0" encoding="utf-8"?>
<root>
  <items>
     <item>
           <title>1</title>
           <link>2</link>
     </item>
  </items>
</root>';
Echo $Xml;
Die();
?>

#T=Header('Content-type:application/json; charset=utf-8');
#T=┉━┉━┉━┉━┉━┉
#T=ai		application/postscript
#T=aif		audio/x-aiff
#T=aifc		audio/x-aiff
#T=aiff		audio/x-aiff
#T=asc		text/plain
#T=au		audio/basic
#T=avi		video/x-msvideo
#T=bcpio		application/x-bcpio
#T=bin		application/octet-stream
#T=bmp		image/bmp
#T=cdf		application/x-netcdf
#T=class		application/octet-stream
#T=cpio		application/x-cpio
#T=cpt		application/mac-compactpro
#T=csh		application/x-csh
#T=css		text/css
#T=dcr		application/x-director
#T=dir		application/x-director
#T=djv		image/vnd.djvu
#T=djvu		image/vnd.djvu
#T=dll		application/octet-stream
#T=dms		application/octet-stream
#T=doc		application/msword
#T=dvi		application/x-dvi
#T=dxr		application/x-director
#T=eps		application/postscript
#T=etx		text/x-setext
#T=exe		application/octet-stream
#T=ez		application/andrew-inset
#T=gif		image/gif
#T=gtar		application/x-gtar
#T=hdf		application/x-hdf
#T=hqx		application/mac-binhex40
#T=htm		text/html
#T=html		text/html
#T=ice		x-conference/x-cooltalk
#T=ief		image/ief
#T=iges		model/iges
#T=igs		model/iges
#T=jpe		image/jpeg
#T=jpeg		image/jpeg
#T=jpg		image/jpeg
#T=js		application/x-javascript
#T=json		header('Content-type:application/json');
#T=kar		audio/midi
#T=latex		application/x-latex
#T=lha		application/octet-stream
#T=lzh		application/octet-stream
#T=m3u		audio/x-mpegurl
#T=man		application/x-troff-man
#T=me		application/x-troff-me
#T=mesh		model/mesh
#T=mid		audio/midi
#T=midi		audio/midi
#T=mif		application/vnd.mif
#T=mov		video/quicktime
#T=movie		video/x-sgi-movie
#T=mp2		audio/mpeg
#T=mp3		audio/mpeg
#T=mpe		video/mpeg
#T=mpeg		video/mpeg
#T=mpg		video/mpeg
#T=mpga		audio/mpeg
#T=ms		application/x-troff-ms
#T=msh		model/mesh
#T=mxu		video/vnd.mpegurl
#T=nc		application/x-netcdf
#T=oda		application/oda
#T=pbm		image/x-portable-bitmap
#T=pdb		chemical/x-pdb
#T=pdf		application/pdf
#T=pgm		image/x-portable-graymap
#T=pgn		application/x-chess-pgn
#T=png		image/png
#T=pnm		image/x-portable-anymap
#T=ppm		image/x-portable-pixmap
#T=ppt		application/vnd.ms-powerpoint
#T=ps		application/postscript
#T=qt		video/quicktime
#T=ra		audio/x-realaudio
#T=ram		audio/x-pn-realaudio
#T=ras		image/x-cmu-raster
#T=rgb		image/x-rgb
#T=rm		audio/x-pn-realaudio
#T=roff		application/x-troff
#T=rpm		audio/x-pn-realaudio-plugin
#T=rtf		text/rtf
#T=rtx		text/richtext
#T=sgm		text/sgml
#T=sgml		text/sgml
#T=sh		application/x-sh
#T=shar		application/x-shar
#T=silo		model/mesh
#T=sit		application/x-stuffit
#T=skd		application/x-koan
#T=skm		application/x-koan
#T=skp		application/x-koan
#T=skt		application/x-koan
#T=smi		application/smil
#T=smil		application/smil
#T=snd		audio/basic
#T=so		application/octet-stream
#T=spl		application/x-futuresplash
#T=src		application/x-wais-source
#T=sv4cpio		application/x-sv4cpio
#T=sv4crc		application/x-sv4crc
#T=swf		application/x-shockwave-flash
#T=t		application/x-troff
#T=tar		application/x-tar
#T=tcl		application/x-tcl
#T=tex		application/x-tex
#T=texi		application/x-texinfo
#T=texinfo		application/x-texinfo
#T=tif		image/tiff
#T=tiff		image/tiff
#T=tr		application/x-troff
#T=tsv		text/tab-separated-values
#T=txt		text/plain
#T=ustar		application/x-ustar
#T=vcd		application/x-cdlink
#T=vrml		model/vrml
#T=wav		audio/x-wav
#T=wbmp		image/vnd.wap.wbmp
#T=wbxml		application/vnd.wap.wbxml
#T=wml		text/vnd.wap.wml
#T=wmlc		application/vnd.wap.wmlc
#T=wmls		text/vnd.wap.wmlscript
#T=wmlsc		application/vnd.wap.wmlscriptc
#T=wrl		model/vrml
#T=xbm		image/x-xbitmap
#T=xht		application/xhtml+xml
#T=xhtml		application/xhtml+xml
#T=xls		application/vnd.ms-excel
#T=xml		text/xml
#T=xpm		image/x-xpixmap
#T=xsl		text/xml
#T=xwd		image/x-xwindowdump
#T=xyz		chemical/x-xyz
#T=zip		application/zip
#