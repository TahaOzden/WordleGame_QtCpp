#include "wordle.h"

Wordle::Wordle(QObject *parent)
    : QObject{parent},
      m_guessedLetters(Constant::numOfLetters,0),
      m_letterTable(Constant::numOfLetters,'A')
{

    readWords();
    selectTheWord();
    createLetterTable();
}

void Wordle::keyClicked(const QString& str)
{
    if ( m_currentRow == Constant::invalidRow)
    {
        return;
    }
    if ( str == "ENTER")
    {
        handleEnter();
    }
    else if ( str.contains(QChar(9003)))
    {
        handleDelete();
    }
    else
    {
        handleKeys(str);
    }
}

void Wordle::handleKeys(const QString &str)
{
    if (m_currentCol >= Constant::numOfCols)
    {
        return;
    }
    m_guessedTexts[m_currentRow] += str;
    m_currentCol = m_guessedTexts[m_currentRow].size();

    emit onKeyClicked(QVariant(m_guessedTexts));
    
    // Added to trigger pipeline, remove this line
    //    qDebug() << "Pressed key : " << str << '\n';
    //    qDebug() << "m_currentCol is : " << m_currentCol << '\n';
    //    qDebug() << "m_guessedText is : " << m_guessedTexts << '\n';

}

void Wordle::handleEnter()
{
    static const QString notEnough = "Not enough letters";
    static const QString notWord = "Not in word list";
    static const QString splendid = "Splendid";

    QString enteredWord = m_guessedTexts[m_currentRow];

    if (m_currentCol < Constant::numOfCols)
    {
        emit msgPop(QVariant(notEnough));
        return;
    }
    if (!m_possibleWords.contains(enteredWord))
    {
        emit msgPop(QVariant(notWord));
        return;
    }
    else if (m_possibleWords.contains(enteredWord) && enteredWord != m_theWord)
    {
        checkEnteredWord(enteredWord);
        checkKeyboard(enteredWord);

        if(!isGameEnded())
        {
            incrementCurrentRow();
            resetColum();
        }
    }
    else
    {
        checkEnteredWord(enteredWord);
        checkKeyboard(enteredWord);
        emit msgPop(QVariant(splendid));
        invalidateRow();
    }
}

void Wordle::checkEnteredWord(const QString &str)
{
    QVector<int> rowWord(Constant::numOfCols,0);
    for (int i{}; i < str.size(); ++i)
    {
        QChar ch = str.at(i);
        int guess; //wrong = 0, wrongPos = 1, correctPos = 2
        if(m_theWord.contains(ch))
        {
            guess = 1;
            if ( m_theWord.at(i) == ch)
            {
                guess = 2;
            }
        }
        else
        {
            guess = 0;
        }
        rowWord[i] = guess;
    }

    emit wordChecked(rowWord);
}

void Wordle::incrementCurrentRow()
{
    m_currentRow++;
}

void Wordle::resetColum()
{
    m_currentCol = 0;
}

void Wordle::invalidateRow()
{
    m_currentRow = Constant::invalidRow;
}

void Wordle::checkKeyboard(const QString &str)
{
    for (int i{}; i < str.size(); ++i)
    {
        QChar ch = str.at(i);
        int guess; //notry = 0, wrong = 1, wrongPos = 2, correctPos = 3
        if(m_theWord.contains(ch))
        {
            guess = 2;
            if ( m_theWord.at(i) == ch)
            {
                guess = 3;
            }
        }
        else
        {
            guess = 1;
        }
        int letterIndex = m_letterTable.indexOf(ch);
        if(m_guessedLetters.at(letterIndex) < guess)
        {
            m_guessedLetters[letterIndex] = guess;
        }
    }

    emit keyboardChecked(m_guessedLetters);
}

void Wordle::handleDelete()
{
    if (m_currentCol <= 0)
    {
        return;
    }
    m_guessedTexts[m_currentRow].remove(m_guessedTexts[m_currentRow].size()-1,1);
    m_currentCol = m_guessedTexts[m_currentRow].size();

    emit onKeyClicked(QVariant(m_guessedTexts));
}

bool Wordle::isGameEnded()
{
    if ( m_currentRow == (Constant::numOfRows-1))
    {
        emit msgPerminent(QVariant(m_theWord));
        invalidateRow();
        return true;
    }
    return false;
}

void Wordle::readWords()
{
    QDir cur = QDir::current();
    if(cur.cdUp() == true)
    {
        m_filePath = cur.absolutePath() + QDir::separator() + "Wordle_Try1" + QDir::separator() +
                "data" + QDir::separator() + "words.txt";
    }

    QFile file(m_filePath);
    if(!file.exists())
    {
        qWarning() << file.errorString();
    }
    if(!file.open(QIODevice::ReadOnly))
    {
        qWarning() << file.errorString();
    }

    while(!file.atEnd())
    {
        m_possibleWords.push_back(file.read(5).toUpper());
    }
    file.close();
}

void Wordle::selectTheWord()
{
    if (!m_possibleWords.empty())
    {
        int num = QRandomGenerator64::global()->generate() % m_possibleWords.size();
        m_theWord = m_possibleWords.at(num);
        qDebug() << "theword is : " << m_theWord;
    }
}

void Wordle::createLetterTable()
{
    QString letters = "QWERTYUIOPASDFGHJKLZXCVBNM";
    for ( int i{}; i < letters.size(); ++i)
    {
        m_letterTable[i] = letters.at(i);
    }
}

int Wordle::row() const
{
    return m_currentRow;
}
