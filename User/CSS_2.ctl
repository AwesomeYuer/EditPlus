#TITLE=CSS 2 by function
#INFO
Cliptext Library for Cascading Style Sheets 2
Based on the W3C CSS2 Specification and the w3schools.com CSS2 Reference
    http://www.w3.org/TR/CSS2/
    http://www.w3schools.com/css/css_reference.asp
This cliptext contains the CSS properties ordered by function.
Author:     Peter Anderson (peterjohnanderson@gmail.com)
Licence:    Creative Commons Attribution Unported (current version)
            http://creativecommons.org.au/licences
Created:    Sunday, 5 April 2009

#SORT=n

#T=BACKGROUND
#T=background
background: ^!^!background-color | background-image | background-repeat background-attachment background-position | background-attachment  Sets whether a background image is fixed or scrolls with the rest of the page  scroll | fixed;
#T=background-color
background-color: ^!^!color-rgb | color-hex | color-name | transparent;
#T=background-image
background-image: ^!^!url(URL) | none | background-position  Sets the starting position of a background image | top left | top center | top right | center left | center center | center right | bottom left | bottom center | bottom right | x% y% | xpos ypos;
#T=background-repeat
background-repeat: ^!^!repeat | repeat-x | repeat-y | no-repeat;
#T=--------------------
#T=BORDER
#T=border
border: ^!border-width | border-style | border-color;
#T=border-bottom
border-bottom: ^!border-bottom-width | border-style | border-color;
#T=border-bottom-color
border-bottom-color: ^!border-color;
#T=border-bottom-style
border-bottom-style: ^!border-style;
#T=border-bottom-width
border-bottom-width: ^!thin | medium | thick | length;
#T=border-color
border-color: ^!color;
#T=border-left
border-left: ^!border-left-width | border-style | border-color
#T=border-left-color
border-left-color: ^!border-color;
#T=border-left-style
border-left-style: ^!border-style;
#T=border-left-width
border-left-width: ^!thin | medium | thick | length;
#T=border-right
border-right: ^!border-right-width | border-style | border-color | border-right-color  Sets the color of the right border  border-color | border-right-style  Sets the style of the right border  border-style | border-right-width  Sets the width of the right border  thin | medium | thick | length;
#T=border-right-color
border-right-color: ^!border-color;
#T=border-right-style
border-right-style: ^!border-style;
#T=border-right-width
border-right-width: ^!thin | medium | thick | length;
#T=border-style
border-style: ^!none | hidden | dotted | dashed | solid | double | groove | ridge | inset | outset;
#T=border-top
border-top: ^!border-top-width | border-style | border-color | border-top-color  Sets the color of the top border  border-color | border-top-style  Sets the style of the top border  border-style | border-top-width  Sets the width of the top border  thin | medium | thick | length;
#T=border-top-color
border-top-color: ^!border-color;
#T=border-top-style
border-top-style: ^!border-style;
#T=border-top-width
border-top-width: ^!thin | medium | thick | length;
#T=border-width
border-width: ^!thin | medium | thick | length;
#T=--------------------
#T=CLASSIFICATION
#T=clear
clear: ^!left | right | both | none;
#T=cursor
cursor: ^!url | auto | crosshair | default | pointer | move | e-resize | ne-resize | nw-resize | n-resize | se-resize | sw-resize | s-resize | w-resize | text | wait | help;
#T=display
display: ^!none | inline | block | list-item | run-in | compact | marker | table | inline-table | table-row-group | table-header-group | table-footer-group | table-row | table-column-group | table-column | table-cell | table-caption;
#T=float
float: ^!left | right | none;
#T=position
position: ^!static | relative | absolute | fixed;
#T=visibility
visibility: ^!visible | hidden | collapse;
#T=--------------------
#T=DIMENSION
#T=height
height: ^!auto | length | %;
#T=line-height
line-height: ^!normal | number | length | %;
#T=max-height
max-height: ^!none | length | %;
#T=max-width
max-width: ^!none | length | %;
#T=min-height
min-height: ^!length | %;
#T=min-width
min-width: ^!length | %;
#T=width
width: ^!auto | length | %;
#T=--------------------
#T=FONT
#T=font
font: ^!font-style | font-variant | font-weight | font-size/line-height | font-family | caption | icon | menu | message-box | small-caption | status-bar;
#T=font-family
font-family: ^!family-name | generic-family;
#T=font-size
font-size: ^!xx-small | x-small | small | medium | large | x-large | xx-large | smaller | larger | length | %;
#T=font-size-adjust
font-size-adjust: ^!none | number;
#T=font-stretch
font-stretch: ^!normal | wider | narrower | ultra-condensed | extra-condensed | condensed | semi-condensed | semi-expanded | expanded | extra-expanded | ultra-expanded;
#T=font-style
font-style: ^!normal | italic | oblique;
#T=font-variant
font-variant: ^!normal | small-caps;
#T=font-weight
font-weight: ^!normal | bold | bolder | lighter | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900;
#T=--------------------
#T=GENERATED CONTENT
#T=content
content: ^!string | url | counter(name) | counter(name, list-style-type) | counters(name, string) | counters(name, string, list-style-type) | attr(X) | open-quote | close-quote | no-open-quote | no-close-quote;
#T=counter-increment
counter-increment: ^!none | identifier number;
#T=counter-reset
counter-reset: ^!none | identifier number;
#T=quotes
quotes: ^!none | string string;
#T=--------------------
#T=LIST AND MARKER
#T=list-style
list-style: ^!list-style-type | list-style-position | list-style-image;
#T=list-style-image
list-style-image: ^!none | url;
#T=list-style-position
list-style-position: ^!inside | outside;
#T=list-style-type
list-style-type: ^!none | disc | circle | square | decimal | decimal-leading-zero | lower-roman | upper-roman | lower-alpha | upper-alpha | lower-greek | lower-latin | upper-latin | hebrew | armenian | georgian | cjk-ideographic | hiragana | katakana | hiragana-iroha | katakana-iroha;
#T=marker-offset
marker-offset: ^!auto | length;
#T=--------------------
#T=MARGIN
#T=margin
margin: ^!margin-top | margin-right | margin-bottom | margin-left;
#T=margin-bottom
margin-bottom: ^!auto | length | %;
#T=margin-left
margin-left: ^!auto | length | %;
#T=margin-right
margin-right: ^!auto | length | %;
#T=margin-top
margin-top: ^!auto | length | %;
#T=--------------------
#T=OUTLINES
#T=outline
outline: ^!outline-color | outline-style | outline-width;
#T=outline-color
outline-color: ^!color | invert;
#T=outline-style
outline-style: ^!none | dotted | dashed | solid | double | groove | ridge | inset | outset;
#T=outline-width
outline-width: ^!thin | medium | thick | length;
#T=--------------------
#T=PADDING
#T=padding
padding: ^!padding-top | padding-right | padding-bottom | padding-left;
#T=padding-bottom
padding-bottom: ^!length | %;
#T=padding-left
padding-left: ^!length | %;
#T=padding-right
padding-right: ^!length | %;
#T=padding-top
padding-top: ^!length | %;
#T=--------------------
#T=POSITIONING
#T=bottom
bottom: ^!auto | % | length;
#T=clip
clip: ^!shape | auto;
#T=left
left: ^!auto | % | length;
#T=overflow
overflow: ^!hidden | scroll | visible | auto;
#T=position
position: ^!static | relative | absolute | fixed;
#T=right
right: ^!auto | % | length;
#T=top
top: ^!length | auto | %;
#T=vertical-align
vertical-align: ^!baseline | bottom | length | middle | sub | super | text-bottom | text-top | top | %;
#T=z-index
z-index: ^!number | auto;
#T=--------------------
#T=TABLE
#T=border-collapse
border-collapse: ^!collapse | separate;
#T=border-spacing
border-spacing: ^!length length;
#T=caption-side
caption-side: ^!top | bottom | left | right;
#T=empty-cells
empty-cells: ^!show | hide;
#T=table-layout
table-layout: ^!fixed | auto;
#T=--------------------
#T=TEXT
#T=color
color: ^!color;
#T=direction
direction: ^!ltr | rtl;
#T=line-height
line-height: ^!normal | number | length | %;
#T=letter-spacing
letter-spacing: ^!normal | length;
#T=text-align
text-align: ^!left | right | center | justify;
#T=text-decoration
text-decoration: ^!none | underline | overline | line-through | blink;
#T=text-indent
text-indent: ^!length | %;
#T=text-shadow
text-shadow: ^!color | length | none;
#T=text-transform
text-transform: ^!capitalize | uppercase | lowercase | none;
#T=unicode-bidi
unicode-bidi: ^!normal | embed | bidi-override;
#T=white-space
white-space: ^!normal | nowrap | pre;
#T=word-spacing
word-spacing: ^!length | normal;
#T=--------------------
#T=PSEUDO-CLASSES
#T=:active
#T=:focus
#T=:hover
#T=:link
#T=:visited
#T=:first-child
#T=:lang
#T=--------------------
#T=PSEUDO-ELEMENTS
#T=:first-letter
#T=:first-line
#T=:before
#T=:after
