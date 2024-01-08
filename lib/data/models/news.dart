class News {
  const News({
    required this.title,
    required this.text,
    required this.dateTime,
    required this.path,
  });

  final String title;
  final String text;
  final DateTime dateTime;
  final String path;
}

final List<News> news = [
  News(
    title:
        'US plans \$162 million award to Microchip Technology to boost production',
    text:
        'WASHINGTON, Jan 4 (Reuters) - The U.S. Commerce Department said on Thursday it plans to award Microchip Technology (MCHP.O) \$162 million in government grants to step up U.S. production of semiconductors and microcontroller units (MCUs) key to the consumer and defense industries.\n\nThe funds will allow Microchip to triple production of mature-node semiconductor chips and microcontroller units at two U.S. factories, officials said.',
    dateTime: DateTime(2024, 1, 5),
    path:
        'https://www.reuters.com/resizer/dNnuL7a9xPAsYnpiHEmA6jvHP-U=/1080x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/2QZWIT3GBVOS5CTBXVIO3SQYKY.jpg',
  ),
  News(
    title: 'Thermo Fisher halts forensic tech sales in Tibet',
    text:
        'SHANGHAI, Jan 5 (Reuters) - Thermo Fisher Scientific (TMO.N) has pledged to stop selling forensic technology and equipment in Tibet that could be used for identifying individuals, a spokesperson for the company said.\n\nThe U.S. firm had offered dedicated human identification (HID) technology in Tibet, a region with a population of about 4 million people in western China, which a spokesperson told Reuters was used for applications that included tracking criminals.',
    dateTime: DateTime(2024, 1, 5),
    path:
        'https://www.reuters.com/resizer/i66OFaW7kV3WkZVUmIb_9IZVBf0=/1200x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/HLY6MWXCXVK7DAFDT2IZTXDUNY.jpg',
  ),
  News(
    title: 'Foxconn expects Q1 revenue drop after slower Q4 demand',
    text:
        'TAIPEI, Jan 5 (Reuters) - Taiwan\'s Foxconn, the world\'s largest contract electronics maker and Apple\'s biggest iPhone assembler, said on Friday it expected an on-year drop in first quarter revenue coming off a high base, after slower market demand hit the previous quarter.\n\nThe first quarter is traditionally quieter than the previous one, the season when Taiwan\'s tech companies race to supply smartphones, tablets and other electronics to major vendors such as Apple (AAPL.O) for Western markets\' year-end holiday period.',
    dateTime: DateTime(2024, 1, 5),
    path:
        'https://www.reuters.com/resizer/gRvKjWw2nBbRvyqJzDvkwC889n4=/1200x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/7UBE5Z5NDZICVEPPYWXIRA67FA.jpg',
  ),
  News(
    title: 'Microsoft adds AI button to keyboards to call up chatbot',
    text:
        'Jan 4 (Reuters) - Microsoft (MSFT.O) said it is adding a button to its Windows keyboard that would pull up the tech giant\'s Copilot service, in the first change for the device in nearly three decades.\n\nThe "Copilot key", announced on Thursday, marks the latest effort by the company, which is investing billions in AI, to incorporate the technology in its products.\n\nThe addition of the key underscores the Redmond, Washington-based company\'s ambitions for AI-enabled PCs.',
    dateTime: DateTime(2024, 1, 4),
    path:
        'https://www.reuters.com/resizer/yseBSjZigXg5zK7uiJ1BwJugavw=/1200x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/6O6JV5YF5RLRPLFMESBYCWXSPE.jpg',
  ),
  News(
    title:
        'Apple slides to eight-week low after second rating downgrade in a week',
    text:
        'Apple (AAPL.O) continued its struggle in the new year on Thursday, plumbing an eight-week low after Piper Sandler handed the tech giant its second downgrade this week on worries about iPhone demand.\n\nThe rating action knocked Apple shares down 1.4% at \$181.6, causing its market value to decline nearly \$170 billion so far in the opening week of 2024.',
    dateTime: DateTime(2024, 1, 4),
    path:
        'https://www.reuters.com/resizer/rLGgio7OySGN9WTleGg4Cwb19bk=/1200x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/75T6SWBOSBNKXL6SQ3JPXHJ5CA.jpg',
  ),
  News(
    title:
        'OpenAI boss Sam Altman says Muslims in tech world fear retaliation in speaking up',
    text:
        'OpenAI CEO Sam Altman said on Thursday he felt members of the Muslim and Arab communities in the tech industry were uncomfortable speaking about their recent experiences, in an apparent reference to the impact of the ongoing war in Gaza.\n\n"Muslim and arab (especially palestinian) colleagues in the tech community i\'ve spoken with feel uncomfortable speaking about their recent experiences, often out of fear of retaliation and damaged career prospects," Altman wrote on social media network X.',
    dateTime: DateTime(2024, 1, 4),
    path:
        'https://www.reuters.com/resizer/X93beLUfolcwdWrl4N61NPaIkhc=/1200x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/K5DCNCAEBRKV3HIXH4MKLSQPPA.jpg',
  ),
  News(
    title: 'Qualcomm says Samsung, Google plan to use its new headset chip',
    text:
        'Qualcomm (QCOM.O) on Thursday said Samsung Electronics (005930.KS) and Alphabet\'s (GOOGL.O) Google plan to use a new computing chip it designed to power mixed and virtual reality headsets.\n\nThe Qualcomm chip, called the Snapdragon XR2+ Gen 2, will be able to handle data feeds from a dozen cameras inside the headset.',
    dateTime: DateTime(2024, 1, 4),
    path:
        'https://www.reuters.com/resizer/pBTv-0ery1odeMSD75sUMnxRj2Q=/1200x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/QXFFNYZEURLXROABVBTQLYDSQE.jpg',
  ),
  News(
    title:
        'Search startup Perplexity AI valued at \$520 mln in funding from Bezos, Nvidia',
    text:
        'Search startup Perplexity AI has raised \$73.6 million from a group of investors including Nvidia (NVDA.O) and Amazon (AMZN.O) founder Jeff Bezos, the latest example of investors hunting for AI startups that challenge incumbents.\n\nThe round was led by venture capital firm IVP and valued the company at about \$520 million, according to the company. NEA, NVIDIA, Databricks, and Bessemer Venture Partners also participated in the round.',
    dateTime: DateTime(2024, 1, 4),
    path:
        'https://www.reuters.com/resizer/yy0pj0eEK2nKt5wv9imAi-gwqHA=/1200x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/DLTMENWIS5PKJMDZ7MJ7JTBJZU.jpg',
  ),
  News(
    title: 'US chip stocks tumble after strongest year since 2009',
    text:
        'U.S. chip stocks added to a string of losses on Wednesday, with Wall Street\'s main semiconductor benchmark tumbling from record highs following its strongest year since 2009, when the sector bounced back after the financial crisis.\n\nDrops of over 2% in Advanced Micro Devices (AMD.O), Qualcomm (QCOM.O) and Broadcom (AVGO.O) weighed most on the PHLX semiconductor index (.SOX), which was down 2.1%.',
    dateTime: DateTime(2024, 1, 3),
    path:
        'https://www.reuters.com/resizer/I7K75UGmN0AVx6kh51kgydzlYLw=/1200x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/VF5N7CEDBJO2NM7U5HEVSNOERQ.jpg',
  ),
  News(
    title:
        'Australia struggles to ditch SUV habit even as electric vehicle sales hit record',
    text:
        ' Electric vehicle (EV) sales in Australia hit an all-time high in 2023, according to the country\'s automotive association, however light vehicle sales remained dominated by emissions-intensive trucks and sports utility vehicles (SUVs).\n\nBattery-electric vehicles were 7.2% of all vehicles sold last year, more than double the 3.1% recorded in 2022, according to data from the Federal Chamber of Automotive Industries (FCAI) on Thursday.',
    dateTime: DateTime(2024, 1, 3),
    path:
        'https://www.reuters.com/resizer/IM7QgY2K_j3WfEzFDbKjdrely7w=/1200x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/FM5ZG4AYEZJXZCBJR6Y4LGI4LI.jpg',
  ),
];
