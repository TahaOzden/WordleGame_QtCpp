#ifndef WORDLE_H
#define WORDLE_H

#include <QObject>
#include <QDebug>
#include <QVariant>
#include <QDir>
#include <QFile>
#include <QIODevice>
#include <QRandomGenerator64>

namespace Constant
  {
  const int numOfLetters = 26;
  const int invalidRow = -1;
  const int numOfCols = 5;
  const int numOfRows = 6;
  };

class Wordle : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int row READ row)

public:
    explicit Wordle(QObject *parent = nullptr);

    int row() const;

public slots:
    void keyClicked(const QString &str);

signals:
    void onKeyClicked (QVariant data);
    void enterPressed (QVariant data);
    void msgPop (QVariant data);
    void msgPerminent (QVariant data);

    void wordChecked(QVector<int> data);
    void keyboardChecked(QVector<int> data);

private:
    void handleKeys(const QString& str);
    void handleEnter();
    void checkEnteredWord(const QString& str);
    void incrementCurrentRow();
    void resetColum();
    void invalidateRow();
    void checkKeyboard(const QString& str);
    void handleDelete();
    bool isGameEnded();

    void readWords();
    void selectTheWord();
    void createLetterTable();

private:
    QStringList m_guessedTexts{Constant::numOfRows};

    QStringList m_possibleWords;
    QString m_filePath;
    QString m_theWord = "CLEAN";
    int m_currentRow = 0;
    int m_currentCol = 0;
    QVector<int> m_guessedLetters;
    QVector<QChar> m_letterTable;
};

#endif // WORDLE_H
