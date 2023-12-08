rm -rf Tests || true

mkdir -p Tests/Original 
touch Tests/Original/original.txt
ln -s $PWD/Tests/Original/original.txt alias.txt
mv alias.txt Tests
file -h Tests/alias.txt
swift run ReplaceAlias Tests/alias.txt
file -h Tests/alias.txt

rm -rf Tests || true

mkdir -p Tests/Original 
touch Tests/Original/original.txt
ln -s $PWD/Tests/Original/original.txt alias.txt
mv alias.txt Tests
file -h Tests/alias.txt
swift run ReplaceAlias $PWD/Tests/alias.txt
file -h Tests/alias.txt

rm -rf Tests || true