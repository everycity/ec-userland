[[ "x$1" == "x" ]] && echo "Error: Please supply packages to export" && exit 1

transform_file=`mktemp`
temprepo=`mktemp -d`

pkgrepo -s file://${temprepo} create
echo "<transform set name=pkg.fmri -> edit value pkg://[^/]+/ pkg://${publisher}/>" > $transform_file

echo Receiving $* into file://${temprepo}
pkgrecv -s ${sourcerepo} -d file://${temprepo} $*
[[ $? -ne 0 ]] && echo "Error: pkgrecv failed - exiting" && rm -rf $temprepo $transform_file && exit 1

echo Setting Publisher
echo ./set-publisher.sh -t $transform_file -p $destrepo file://$temprepo
./set-publisher.sh -t $transform_file -p $destrepo file://$temprepo
[[ $? -ne 0 ]] && echo "Error: set-publisher.sh failed - exiting" && rm -rf $temprepo $transform_file && exit 1

rm -rf $temprepo $transform_file
