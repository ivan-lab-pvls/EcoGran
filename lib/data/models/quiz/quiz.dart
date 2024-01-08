import 'package:ecogrand_bank/data/models/quiz/answer.dart';
import 'package:ecogrand_bank/data/models/quiz/person.dart';
import 'package:ecogrand_bank/data/models/quiz/question.dart';

class Quiz {
  const Quiz({
    required this.title,
    required this.questions,
    required this.date,
  });

  final String title;
  final List<Question> questions;
  final DateTime date;
}

final List<Quiz> quizes = [
  Quiz(
    title: 'Additional features and improvements',
    questions: [
      Question(
        text:
            'What additional features or services would you like to see in your bank\'s mobile application?',
        person: Person.bruno(),
        date: DateTime(2024, 1, 5),
        answers: [
          Answer(
            text:
                'The ability to manage personal investments and securities portfolio directly through the application.',
            person: Person.buster(),
            date: DateTime(2024, 1, 5),
          ),
          Answer(
            text:
                'The option to connect and manage additional financial products such as insurance or retirement planning.',
            person: Person.dylan(),
            date: DateTime(2024, 1, 5),
          ),
          Answer(
            text:
                'Integration with budgeting systems and expense tracking for better financial control.',
            person: Person.emma(),
            date: DateTime(2024, 1, 5),
          ),
        ],
      ),
      Question(
        text:
            'Do you feel that the mobile application fully meets your needs for financial management, or is there something you feel is lacking?',
        person: Person.buster(),
        date: DateTime(2024, 1, 5),
        answers: [
          Answer(
            text:
                'The application more than satisfies my needs, but adding support for cryptocurrency investments would be fantastic. ',
            person: Person.bruno(),
            date: DateTime(2024, 1, 5),
          ),
          Answer(
            text:
                'The core functionality is good, but built-in tools for budget planning and tracking are missing.',
            person: Person.rachel(),
            date: DateTime(2024, 1, 5),
          ),
          Answer(
            text:
                'The mobile application largely meets my needs, but enhanced analysis capabilities for income and expenses would be useful.',
            person: Person.emma(),
            date: DateTime(2024, 1, 5),
          ),
        ],
      ),
      Question(
        text:
            'How would you feel about adding functionality for investment management or financial goals to the application?',
        person: Person.emma(),
        date: DateTime(2024, 1, 5),
        answers: [
          Answer(
            text:
                'Adding functionality for automatic investment of surplus funds into investment goals would be great.',
            person: Person.rachel(),
            date: DateTime(2024, 1, 5),
          ),
          Answer(
            text:
                'I definitely welcome the ability to manage investments and set financial goals directly through the mobile application. ',
            person: Person.bruno(),
            date: DateTime(2024, 1, 5),
          ),
          Answer(
            text:
                'I believe that integrating with investment platforms and tools for investment planning would make the application more comprehensive.',
            person: Person.dylan(),
            date: DateTime(2024, 1, 5),
          ),
        ],
      ),
      Question(
        text:
            'Are there any aspects of the mobile banking application that could be improved to increase your interest or engagement?',
        person: Person.rachel(),
        date: DateTime(2024, 1, 4),
        answers: [
          Answer(
            text:
                'Increased interactivity and the ability to participate in financial literacy games could significantly enhance the user experience.',
            person: Person.dylan(),
            date: DateTime(2024, 1, 4),
          ),
          Answer(
            text:
                'It would be great if the application provided more personalized financial recommendations and advice based on my spending and goals.',
            person: Person.emma(),
            date: DateTime(2024, 1, 4),
          ),
          Answer(
            text:
                'Adding financial courses or articles would make the application more appealing and informative. ',
            person: Person.bruno(),
            date: DateTime(2024, 1, 4),
          ),
        ],
      ),
      Question(
        text:
            'What changes or enhancements in the application could make your experience of using it more convenient or enjoyable?',
        person: Person.buster(),
        date: DateTime(2024, 1, 4),
        answers: [
          Answer(
            text:
                'I would like to see improved tools for analyzing my financial transactions and transparent reports on expenses and incomes.',
            person: Person.bruno(),
            date: DateTime(2024, 1, 4),
          ),
          Answer(
            text:
                'Adding functionality for quick creation of investment portfolios and tracking their performance could make using the application more convenient.',
            person: Person.rachel(),
            date: DateTime(2024, 1, 4),
          ),
          Answer(
            text:
                'Improving the interface and adding personalized notifications about my financial assets would make my experience of using the application more convenient and enjoyable. ',
            person: Person.dylan(),
            date: DateTime(2024, 1, 4),
          ),
        ],
      ),
    ],
    date: DateTime(2024, 1, 5),
  ),
  Quiz(
    title: 'Convenience of using the mobile banking application',
    questions: [
      Question(
        text:
            'How do you rate the overall convenience of using the mobile banking application for conducting financial transactions?',
        person: Person.dylan(),
        date: DateTime(2024, 1, 3),
        answers: [
          Answer(
            text:
                'I rate the convenience of using the application as high due to its intuitive interface and fast navigation.',
            person: Person.rachel(),
            date: DateTime(2024, 1, 3),
          ),
          Answer(
            text:
                'The overall convenience is good, but I would like to have more personalized features tailored to my needs.',
            person: Person.dylan(),
            date: DateTime(2024, 1, 3),
          ),
          Answer(
            text:
                'The convenience of using the application is generally satisfactory, but could be improved to optimize the process of conducting operations.',
            person: Person.emma(),
            date: DateTime(2024, 1, 3),
          ),
        ],
      ),
      Question(
        text:
            'Are there any features or operations that you find inconvenient or in need of improvement in the mobile application?',
        person: Person.emma(),
        date: DateTime(2024, 1, 3),
        answers: [
          Answer(
            text:
                'Some features, such as setting up recurring payments, require too many steps to configure.',
            person: Person.buster(),
            date: DateTime(2024, 1, 3),
          ),
          Answer(
            text:
                'Currency conversion operations between accounts are challenging due to unclear exchange rates.',
            person: Person.dylan(),
            date: DateTime(2024, 1, 3),
          ),
          Answer(
            text:
                'The ability to scan and add checks in the application does not always work reliably and requires improvements.',
            person: Person.rachel(),
            date: DateTime(2024, 1, 3),
          ),
        ],
      ),
      Question(
        text:
            'What is your opinion on the authentication process and security in the mobile application?',
        person: Person.rachel(),
        date: DateTime(2024, 1, 2),
        answers: [
          Answer(
            text:
                'The authentication process and security in the application are quite satisfactory and inspire confidence.',
            person: Person.dylan(),
            date: DateTime(2024, 1, 2),
          ),
          Answer(
            text:
                'User authentication could be more convenient, possibly using biometric data. ',
            person: Person.bruno(),
            date: DateTime(2024, 1, 2),
          ),
          Answer(
            text:
                'Adding additional authentication methods, such as two-factor authentication, would enhance the level of security.',
            person: Person.emma(),
            date: DateTime(2024, 1, 2),
          ),
        ],
      ),
      Question(
        text:
            'How do you rate the time it takes to perform basic operations in the application, such as transfers, bill payments, and account management?',
        person: Person.dylan(),
        date: DateTime(2024, 1, 2),
        answers: [
          Answer(
            text:
                'The time it takes to perform operations in the application is quite satisfactory and meets my expectations.',
            person: Person.rachel(),
            date: DateTime(2024, 1, 2),
          ),
          Answer(
            text:
                'Transfers between accounts could be executed more quickly for user convenience.',
            person: Person.emma(),
            date: DateTime(2024, 1, 2),
          ),
          Answer(
            text:
                'The overall time it takes to perform operations is acceptable, although processing payments between different banks requires improvement. ',
            person: Person.bruno(),
            date: DateTime(2024, 1, 2),
          ),
        ],
      ),
      Question(
        text:
            'What additional features or improvements would you like to see in the mobile banking application to enhance its convenience of use?',
        person: Person.dylan(),
        date: DateTime(2024, 1, 2),
        answers: [
          Answer(
            text:
                'I would like to see more intuitive analytical tools for tracking financial goals and expenses.',
            person: Person.bruno(),
            date: DateTime(2024, 1, 2),
          ),
          Answer(
            text:
                'Adding the ability to view and pay bills from a photo would make account management even more convenient.',
            person: Person.rachel(),
            date: DateTime(2024, 1, 2),
          ),
          Answer(
            text:
                'Expanding the options for setting transaction alerts and notifications would increase control and convenience of use.',
            person: Person.buster(),
            date: DateTime(2024, 1, 2),
          ),
        ],
      ),
    ],
    date: DateTime(2024, 1, 3),
  ),
];
