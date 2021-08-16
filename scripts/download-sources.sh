echo "Downloading LFS packages.."
echo "Getting wget-list.."
wget --timestamping $LFS_SOURCES/lfs/view/10.1/wget-list

echo "Getting packages.."
wget --timestamping --continue --input-file=wget-list

wget https://github.com/libexpat/libexpat/releases/download/R_2_2_10/expat-2.2.10.tar.xz

echo "Getting md5.."
wget --timestamping $LFS_SOURCES/lfs/downloads/10.1/md5sums

echo "Check hashes.."
md5sum -c md5sums