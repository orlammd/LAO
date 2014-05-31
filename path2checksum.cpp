#include <QString>
#include <QHash>
#include <QTextStream>
#include <iostream>

using namespace std;

int main(){

QTextStream qtin(stdin); 
quint16 hash;

QString path;

std::cout << "Vas-y pour voir" << std::endl;
qtin >> path;

hash = qChecksum(path.toUtf8().data(), path.length());

std::cout << hash << std::endl;
return 0;
}
