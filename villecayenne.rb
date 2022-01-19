url="http://www.ville-cayenne.fr"
myfile="/themes/cayenne.fr/css/images/"
file="logo.jpg"
`(mkdir -p "public#{myfile}" && cd "public#{myfile}" &&  wget "#{url+myfile+file}")`
myfile="/files/2020/11/"
file="WhatsApp-Image-2020-10-29-at-08.13.15.jpeg"
`(mkdir -p "public#{myfile}" && cd "public#{myfile}" &&  wget "#{url+myfile+file}")`
