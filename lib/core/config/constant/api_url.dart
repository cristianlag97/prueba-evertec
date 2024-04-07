part of core.config.constant;

const String usCurrent = '/us/current.json';
const String statesInfo = '/states/info.json';
const String statesCurrent = '/states/current.json';
String statusDetails({String state = ''}) => '/states/$state/info.json';
