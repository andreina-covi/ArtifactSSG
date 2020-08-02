| typeInfo block tCFactory |"First, we execute an usage example to collect type information of the target class"block := [             (SStack newStackWith: (OrderedCollection new             add: 12;            add: -2;            add: 'hello';            add: #nameOf;            add: ((SSTeacher name: 'Johan' with: 15)            nickname;            canRegister: ((SConference price: 50) offerPrice: 50);            idTeacher;            yearsWorkExperience);            yourself )) firstLinkStack;            lastLinkStack;            top;            push: 4;            pop             ] .typeInfo := STypeInfo asTypeInfo: (        SSTypeCollector profile: block onPackagesMatching: 'SmallSuiteGenerator-Scenario')."then, we use the type information to generate tests"tCFactory := STestCaseFactoryPharo new    typeInfo: typeInfo;    fitness: SStatementCoverage new;    targetClassName: #SStack;    targetPackageRegex: 'SmallSuiteGenerator-Scenario';    outputPackageName: 'SmallSuiteGenerator-Tests-Generated';    numberOfGenerations: 5;    numberOfStatements: 15;    populationSize: 10;     seed: 146;     seedBlock: block;     selectionStrategyTestCase: SGATournamentSelection new;     asDict: true;    createTestCases;    yourself.tCFactory