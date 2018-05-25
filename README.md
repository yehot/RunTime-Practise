# iOS run-time 获取 SDK 中的类信息

> 打印任意 iOS SDK 中的全部类名

> 详见： [Runtime 获取任意 SDK 中的全部类名](http://www.jianshu.com/p/534eccb63974)

> 以 友盟 为例

## 一、获取 SDK 中的 private 类名：

调用 `[self flexPrintClassNames];` 输出:

```
// public
MobClick,
MobClickGameAnalytics,
MobClickSocialAnalytics,

// private
MobClickEvent,
MobClickSession,
UMANetWork,
UMANEvent,
UMANOpenUDID,
UMANWorker,
UMCachedDB,
UMDispatchEvent,
UMTException,
UMTMemoryBuffer,

DplusMobClick,
MobClickApp,
MobClickConfig,
MobClickEnvelope,
MobClickInternal,
MobClickJob,
MobClickLocation,
MobClickSocialOperation,
MobClickSocialWeibo,
MobClickUtility,
UMADplus,
UMAggregatedValue,
UMAnalyticsConfig,
UMANBaseEvent,
UMANDeflated,
UMANEkv,
UMANError,
UMANProtocolData,
UMANTerminate,
UMANUtil,
UMAOCTools,
"umeng_envelopeConstants",
UmengUncaughtExceptionHandler,
UMEnvelope,
UMEventMgr,
UMGameLevel,
UMHelper,
UMPayloadBuild,
UMTBinaryProtocol,
UMTBinaryProtocolFactory,
UMTIdJournal,
UMTIdSnapshot,
UMTIdTracking,
UMTImprint,
UMTImprintValue,
UMTProtocolException,
UMTProtocolUtil,
UMTResponse,
UMTTransportException,
"UMTumeng_analyticsConstants",
UMUaDB,
UMWorkDispatch,
```

## 二、获取类的属性、方法

获取到 SDK 中 private class 后，获取某个类的属性、方法、协议列表，eg:

调用 `[self printClassInfo:@"MobClickApp"];` 输出：

```
ivar[0] ----  B : _crashReportEnabled
ivar[1] ----  B : _backgroundTaskEnabled
ivar[2] ----  B : _logEnabled
ivar[3] ----  d : _logSendInterval
ivar[4] ----  Q : _backgroundTaskIdentifier
ivar[5] ----  @"NSString" : _appVersion
ivar[6] ----  @"NSString" : _channel
ivar[7] ----  i : _reportPolicy
ivar[8] ----  B : _encryptEnabled
ivar[9] ----  B : _appCrashedHandlerInstalled
ivar[10] ----  Q : _activateMsgTS
ivar[11] ----  @"NSString" : _appid
ivar[12] ----  Q : _scenarioType
ivar[13] ----  @"NSString" : _wrapperType
ivar[14] ----  @"NSString" : _wrapperVersion
ivar[15] ----  @"NSString" : _vcName
instance method[0] ---- setVcName:
instance method[1] ---- vcName
instance method[2] ---- logEnabled
instance method[3] ---- reportPolicy
instance method[4] ---- logSendInterval
instance method[5] ---- appid
instance method[6] ---- encryptEnabled
instance method[7] ---- setActivateMsgFlag
instance method[8] ---- activateMsgTS
instance method[9] ---- scenarioType
instance method[10] ---- beginBackgroundTask
instance method[11] ---- setAppid:
instance method[12] ---- crashReportEnabled
instance method[13] ---- setCrashReportEnabled:
instance method[14] ---- noAppKeyException
instance method[15] ---- appVersion
instance method[16] ---- wrapperType
instance method[17] ---- wrapperVersion
instance method[18] ---- setAppVersion:
instance method[19] ---- setEncryptEnabled:
instance method[20] ---- setLogSendInterval:
instance method[21] ---- setLogEnabled:
instance method[22] ---- setScenarioType:
instance method[23] ---- setWrapperType:
instance method[24] ---- setWrapperVersion:
instance method[25] ---- setBackgroundTaskEnabled:
instance method[26] ---- setReportPolicy:
instance method[27] ---- setAppCrashedHandlerInstalled:
instance method[28] ---- setActivateMsgTS:
instance method[29] ---- appCrashedHandlerInstalled
instance method[30] ---- backgroundTaskEnabled
instance method[31] ---- dealloc
instance method[32] ---- endBackgroundTask
instance method[33] ---- setChannel:
instance method[34] ---- channel
class method[0] ---- isIntegratedTestModel
class method[1] ---- setCrashReportEnabled:
class method[2] ---- setAppVersion:
class method[3] ---- setEncryptEnabled:
class method[4] ---- minReportInterval
class method[5] ---- setLogEnabled:
class method[6] ---- setBackgroundTaskEnabled:
class method[7] ---- verifyReportPolicy:
class method[8] ---- sharedInstance
class method[9] ---- sessionId
```
