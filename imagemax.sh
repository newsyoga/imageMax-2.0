./conv.sh


mkdir -p compressed
cd webp_output/l1

cp ../../comp_80.sh .
cp ../../comp_30.sh .
cp ../../comp_50.sh .

./comp_80.sh
mv webp_output_* ../../compressed

./comp_30.sh
mv webp_output_* ../../compressed

./comp_50.sh
mv webp_output_* ../../compressed

cd ../../
# cp -r webp_output/l1/webp_output_* compressed
rm -r webp_output
