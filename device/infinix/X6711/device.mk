LOCAL_PATH := device/infinix/X6711

PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_VENDOR_PROPERTIES += \
    ro.product.device=Infinix-X6711 \
    ro.product.name=X6711-GL \
    ro.product.model=Infinix X6711 \
    ro.product.brand=Infinix \
    ro.product.manufacturer=Infinix \
    ro.hardware=mt6833

# X6711 prebuilt kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel/Image.gz
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

# AI16ROM SYSTEM APPLICATIONS
PRODUCT_PACKAGES += \
    AI16Core \
    AI16Assistant \
    AI16Camera \
    AI16Gallery \
    AI16Studio \
    AI16Vision \
    AI16Settings \
    AI16Recorder

    
# X6711 A/B OTA
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    vendor_boot \
    dtbo \
    system \
    system_ext \
    product \
    vendor \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor


# AI16 COMPLETE FEATURE APP PACK
PRODUCT_PACKAGES += \
    AI16Search \
    AI16Translate \
    AI16OCR \
    AI16Documents \
    AI16Files \
    AI16Notes \
    AI16Clipboard \
    AI16Share \
    AI16Phone \
    AI16Contacts \
    AI16Messages \
    AI16Calendar \
    AI16Clock \
    AI16Weather \
    AI16Screen \
    AI16Automation \
    AI16Memory \
    AI16Privacy \
    AI16Security \
    AI16Vault \
    AI16Backup \
    AI16OTA \
    AI16Themes \
    AI16Fonts \
    AI16ControlCenter \
    AI16LockScreen \
    AI16Launcher \
    AI16Wallpaper \
    AI16AR \
    AI16Movie \
    AI16Effects \
    AI16Animal \
    AI16Voice \
    AI16Accessibility \
    AI16GameSpace \
    AI16GameShift \
    AI16SmartManager \
    AI16XClone \
    AI16Freezer \
    AI16LiveActivities \
    AI16Focus \
    AI16DynamicUI \
    AI16GlowSpace \
    AI16LiquidUI \
    AI16NaturalDepth \
    AI16SnapMemo \
    AI16MindHub \
    AI16CallAssistant \
    AI16ScreenSummary \
    AI16ScreenTags \
    AI16SmartScreenshot \
    AI16SmartShare \
    AI16SmartWiFi \
    AI16SmartBluetooth \
    AI16MultiWindow \
    AI16FloatingWindow \
    AI16Battery \
    AI16Charging \
    AI16Performance \
    AI16Thermal \
    AI16Avatar \
    AI16Character \
    AI16FaceSwap \
    AI16SubjectSwap \
    AI16AnimalSwap \
    AI16AIPhoto \
    AI16AIVideo \
    AI16Cinematic \
    AI16RealMotion \
    AI16FastMotion \
    AI16CameraStudio \
    AI16PhotoEditor \
    AI16VideoEditor \
    AI16LivePhoto \
    AI16DepthPhoto \
    AI16SceneAI \
    AI16AudioAI \
    AI16VoiceAI \
    AI16StoryAI \
    AI16ChoreographyAI \
    AI16ContinuityAI \
    AI16AIActions


# AI16 ADDITIONAL FEATURE MODULES
PRODUCT_PACKAGES += \
    AI16QuickSettings \
    AI16DeviceCare \
    AI16SystemManager \
    AI16Updater \
    AI16Recovery \
    AI16BackupRestore \
    AI16Migration \
    AI16SetupWizard \
    AI16CameraPro \
    AI16PortraitStudio \
    AI16ImageUpscaler \
    AI16ImageRestoration \
    AI16BackgroundStudio \
    AI16ThemeStore \
    AI16Icons \
    AI16AlwaysOnDisplay \
    AI16CallScreening \
    AI16CallRecording \
    AI16VideoCall \
    AI16CommunicationHub \
    AI16Writing \
    AI16NotificationAI \
    AI16DocumentAI \
    AI16MeetingAI \
    AI16Summary \
    AI16Knowledge \
    AI16Scanner \
    AI16Calculator \
    AI16Music \
    AI16Player \
    AI16NearbyShare \
    AI16PrivacyDashboard \
    AI16PermissionManager \
    AI16PrivateSpace \
    AI16AppLock \
    AI16SecureFolder \
    AI16AntiTracking \
    AI16SecureAI \
    AI16GameAssistant \
    AI16GamingVoice \
    AI16RAMManager \
    AI16StorageManager \
    AI16CharacterStudio \
    AI16AvatarStudio \
    AI16LalluPattu \
    AI16AREffects \
    AI16ARTracking \
    AI16SpatialPlacement \
    AI16CameraChoreography \
    AI16CharacterContinuity \
    AI16FaceContinuity \
    AI16CostumeContinuity \
    AI16LocationContinuity \
    AI16VFX \
    AI16SFX \
    AI16AudioStudio \
    AI16Connectivity \
    AI16NFC \
    AI16SensorHub \
    AI16DeviceDiagnostics \
    AI16HardwareInfo \
    AI16LiveCaption \
    AI16LiveTranscribe \
    AI16VoiceAccess \
    AI16ScreenReader \
    AI16Magnification \
    AI16HearingAssistance \
    AI16BootDiagnostics \
    AI16OTASystem \
    AI16ABSlotManager \
    AI16UpdateRecovery


# AI16 FINAL FEATURE EXTENSIONS
PRODUCT_PACKAGES += \
    AI16Wellness \
    AI16DigitalWellbeing \
    AI16ParentalControls \
    AI16Emergency \
    AI16SOS \
    AI16CarMode \
    AI16DrivingMode \
    AI16Bedtime \
    AI16ModesRoutines \
    AI16SmartHome \
    AI16RemoteDevice \
    AI16DeviceMigration \
    AI16CrossDevice \
    AI16CrossClipboard \
    AI16CrossFileTransfer \
    AI16CrossCamera \
    AI16PCLink \
    AI16TabletLink \
    AI16MultiDeviceAudio \
    AI16WirelessDisplay \
    AI16ScreenCast \
    AI16OTGManager \
    AI16SIMManager \
    AI16NetworkManager \
    AI165GManager \
    AI16WiFiDiagnostics \
    AI16BluetoothDiagnostics \
    AI16NetworkSpeed \
    AI16DataUsage \
    AI16VPN \
    AI16DNS \
    AI16APN \
    AI16StickerMaker \
    AI16Emoji \
    AI16PortraitEffects \
    AI16Beauty \
    AI16Relight \
    AI16Colorization \
    AI16SuperResolution \
    AI16PhotoCollage \
    AI16Slideshow \
    AI16Memories \
    AI16VideoStabilizer \
    AI16AudioCleanup \
    AI16VoiceIsolation \
    AI16SubtitleEditor \
    AI16MusicSync \
    AI16ThumbnailMaker \
    AI16PosterMaker \
    AI16TitleAssistant \
    AI16SmartBattery \
    AI16AdaptivePerformance \
    AI16StorageCleaner \
    AI16DuplicateCleaner \
    AI16LargeFileAnalyzer \
    AI16AppUsage \
    AI16BackgroundManager \
    AI16StartupManager \
    AI16NotificationManager \
    AI16PermissionAdvisor \
    AI16PrivacyTimeline \
    AI16SecurityScan \
    AI16AppIntegrity \
    AI16CrashDiagnostics \
    AI16ANRDiagnostics \
    AI16LogViewer \
    AI16DeveloperHub \
    AI16GestureAssistant \
    AI16VoiceNavigation \
    AI16OneHanded \
    AI16ColorCorrection \
    AI16HighContrast \
    AI16TouchAssistant


# AI16 HARDWARE AND ADVANCED FEATURE PACK
PRODUCT_PACKAGES += \
    AI16BatteryHealth \
    AI16AdaptiveCharging \
    AI16ChargingAnimation \
    AI16ChargingSound \
    AI16ChargingProtection \
    AI16BatteryTemperature \
    AI16ChargeLimit \
    AI16ReverseCharging \
    AI16BatteryAI \
    AI16AppBattery \
    AI16SmartNetwork \
    AI16DualSIM \
    AI16VoLTE \
    AI16VoWiFi \
    AI16Hotspot \
    AI16BluetoothAudio \
    AI16NearbyDevices \
    AI16Cast \
    AI16USBManager \
    AI16OTG \
    AI16AdaptiveRefresh \
    AI16DisplayColor \
    AI16VideoEnhancement \
    AI16ReadingMode \
    AI16EyeComfort \
    AI16ExtraDim \
    AI16ScreenAttention \
    AI16EdgeGestures \
    AI16HapticEngine \
    AI16TouchTuning \
    AI16PocketMode \
    AI16AudioEnhancement \
    AI16SpeakerOptimization \
    AI16HeadphoneEnhancement \
    AI16SpatialAudio \
    AI16Equalizer \
    AI16AudioProfiles \
    AI16MicNoiseSuppression \
    AI16WindNoiseReduction \
    AI16RecordingEnhancement \
    AI16CameraCalibration \
    AI16LensManager \
    AI16CameraQuickLaunch \
    AI16CameraWatermark \
    AI16CameraGrid \
    AI16CameraLevel \
    AI16Histogram \
    AI16FocusPeaking \
    AI16ManualCamera \
    AI16AIFraming \
    AI16HorizonCorrection \
    AI16VideoStabilization \
    AI16ModelManager \
    AI16ModelUpdater \
    AI16AIAccelerator \
    AI16OfflineAI \
    AI16CloudAI \
    AI16AIPrivacy \
    AI16AIProcessingQueue \
    AI16AITaskHistory \
    AI16AIUsage \
    AI16AIModelStorage \
    AI16DeveloperOptions \
    AI16HardwareTest \
    AI16SensorTest \
    AI16CameraTest \
    AI16DisplayTest \
    AI16SpeakerTest \
    AI16MicrophoneTest \
    AI16VibrationTest \
    AI16TouchTest \
    AI16BatteryTest \
    AI16NetworkTest \
    AI16GPUInfo \
    AI16CPUInfo \
    AI16ThermalMonitor \
    AI16BugReport \
    AI16Telugu \
    AI16Hindi \
    AI16English \
    AI16IndicLanguages \
    AI16VoiceLanguages \
    AI16TTS \
    AI16OfflineLanguages \
    AI16RegionalSettings \
    AI16Modes \
    AI16Routines \
    AI16MovieMode \
    AI16CameraMode \
    AI16WorkMode \
    AI16StudyMode \
    AI16TravelMode \
    AI16MeetingMode \
    AI16DoNotDisturbAI \
    AI16EmojiMaker \
    AI16AIBeauty \
    AI16AIRelight \
    AI16AIColorization \
    AI16AISuperResolution \
    AI16AISlideshow \
    AI16AIMemories \
    AI16AIThumbnail \
    AI16AIPoster \
    AI16AITrailer \
    AI16AIBeatSync \
    AI16Storyboard \
    AI16ShotList \
    AI16ScenePlanner \
    AI16CharacterPlanner \
    AI16LocationPlanner \
    AI16LightingPlanner \
    AI16CameraPlanner \
    AI16ContinuityTracker \
    AI16CostumeTracker \
    AI16FaceTracker \
    AI16AudioSFX \
    AI16SubtitleAI \
    AI16TheftProtection \
    AI16FindDevice \
    AI16RemoteLock \
    AI16SecureErase \
    AI16SIMChangeProtection \
    AI16USBSecurity \
    AI16UnknownSourceProtection \
    AI16GestureAI \
    AI16OneHandedMode \
    AI16LiveCaptionAI \
    AI16LiveTranscribeAI \
    AI16MonoAudio \
    AI16SwitchAccessAI \
    AI16VoiceChanger \
    AI16CallVoiceChanger \
    AI16VoiceEffects \
    AI16CallVoiceEffects \
    AI16VoIPVoiceEffects


# AI16 MASTER FINAL FEATURE PACK
PRODUCT_PACKAGES += \
    AI16NotificationPriority \
    AI16NotificationGrouping \
    AI16NotificationReply \
    AI16NotificationTranslation \
    AI16NotificationPrivacy \
    AI16OTPAssistant \
    AI16ScamSMS \
    AI16ScamWeb \
    AI16EmailAI \
    AI16InboxAI \
    AI16MissedCallAI \
    AI16VoicemailAI \
    AI16CallWaitingAI \
    AI16AppBehavior \
    AI16PermissionAnomaly \
    AI16AccessibilitySecurity \
    AI16OverlayProtection \
    AI16PhishingProtection \
    AI16CertificateGuard \
    AI16SideloadProtection \
    AI16RansomwareProtection \
    AI16SensitiveFileGuard \
    AI16ClipboardProtection \
    AI16ScreenCaptureProtection \
    AI16BluetoothSecurity \
    AI16WiFiSecurity \
    AI16SIMSwapProtection \
    AI16AccountProtection \
    AI16SecurityTimeline \
    AI16AppNetworkMonitor \
    AI16DNSLeakProtection \
    AI16PublicWiFiGuard \
    AI16HotspotProtection \
    AI16CaptivePortal \
    AI16NetworkAI \
    AI16NetworkDiagnostics \
    AI16DataSavingAI \
    AI16RoamingAI \
    AI16DualSIMAI \
    AI16DeviceHealth \
    AI16StorageHealth \
    AI16BatteryHealthAI \
    AI16ThermalHealth \
    AI16SensorHealth \
    AI16CameraHealth \
    AI16DisplayHealth \
    AI16AudioHealth \
    AI16USBHealth \
    AI16ChargingPortHealth \
    AI16ProblemReport \
    AI16SafeModeAssistant \
    AI16CrashRecovery \
    AI16OvernightBatteryAI \
    AI16ChargingOptimizer \
    AI16BackgroundOptimizer \
    AI16PowerAutomation \
    AI16PersonalRoutines \
    AI16ContextActions \
    AI16TimeAwareAI \
    AI16SmartSuggestions \
    AI16PersonalAI \
    AI16AIMemorySearch \
    AI16AIMemoryControls \
    AI16AIMemoryExport \
    AI16WakeWord \
    AI16OfflineVoice \
    AI16VoiceTyping \
    AI16VoiceTranslation \
    AI16VoiceSummary \
    AI16SpeakerRecognition \
    AI16VoiceProfiles \
    AI16ConversationMode \
    AI16HandsFree \
    AI16CharacterVoice \
    AI16CharacterLipSync \
    AI16CharacterExpression \
    AI16CharacterGesture \
    AI16CallerAnalysis \
    AI16CallTranscription \
    AI16CallSummary \
    AI16CallNotes \
    AI16CallTranslation \
    AI16AutoLens \
    AI16ExposureAI \
    AI16MotionDetection \
    AI16LowLightAI \
    AI16BlurDetection \
    AI16EyeDetection \
    AI16BestShotAI \
    AI16GroupPhotoAI \
    AI16DocumentEdgeAI \
    AI16QRScannerAI \
    AI16VisualSearch \
    AI16VideoHighlights \
    AI16SceneDetection \
    AI16AudioCleanupAI \
    AI16SubtitleGenerator \
    AI16SubtitleTranslation \
    AI16HighlightReel \
    AI16VideoChapters \
    AI16VideoSearch \
    AI16CinematicReframe \
    AI16SemanticGallery \
    AI16SimilarPhotos \
    AI16DocumentGallery \
    AI16ScreenshotGallery \
    AI16ReceiptGallery \
    AI16TravelGallery \
    AI16EventMemories \
    AI16BestPhotoAI \
    AI16PrivateGalleryAI \
    AI16GameOverlay \
    AI16GameNetworkAI \
    AI16GameTouchAI \
    AI16GameNotification \
    AI16GameVoice \
    AI16GamePerformance \
    AI16GameThermal \
    AI16GameRecorder \
    AI16MatterHub \
    AI16DeviceContinuity \
    AI16PhonePCLink \
    AI16PhoneTabletLink \
    AI16RemoteDeviceAI \
    AI16MultiDeviceMedia \
    AI16EmergencySOS \
    AI16EmergencyContacts \
    AI16EmergencyLocation \
    AI16SafetyCheck \
    AI16ScheduledSafety \
    AI16EmergencyFlashlight \
    AI16EmergencySiren \
    AI16SafetyCard \
    AI16AppPairs \
    AI16SplitScreenAI \
    AI16FloatingWindows \
    AI16PIPAI \
    AI16SettingsSearch \
    AI16ContextualSettings \
    AI16AILogAnalyzer \
    AI16BugReportAI \
    AI16PackageInspector \
    AI16PermissionInspector \
    AI16ServiceInspector \
    AI16BatteryAnalyzer \
    AI16ThermalAnalyzer \
    AI16CameraInspector \
    AI16HALDiagnostics \
    AI16OTAHealth \
    AI16UpdateVerifier \
    AI16SlotHealth \
    AI16UpdateRecoveryAI \
    AI16RollbackManager \
    AI16UpdateHistory \
    AI16PostUpdateDiagnostics


# AI16 REMAINING FUNCTIONAL FOUNDATION
PRODUCT_PACKAGES += \
    AI16CallerID \
    AI16SpamGuard \
    AI16CallScreen \
    AI16CallQuality \
    AI16AITaskQueue \
    AI16AIHistory \
    AI16AICloudBridge \
    AI16AIPermission \
    AI16AIMemoryStore \
    AI16AIMemoryControl \
    AI16AIActionEngine \
    AI16AIConfirmation \
    AI16BehaviorGuard \
    AI16AccessibilityGuard \
    AI16OverlayGuard \
    AI16PhishingGuard \
    AI16SideloadGuard \
    AI16ClipboardGuard \
    AI16ScreenCaptureGuard \
    AI16USBGuard \
    AI16SIMSecurity \
    AI16AccountGuard \
    AI16SecurityReport \
    AI16CameraRuntime \
    AI16CameraCapabilities \
    AI16HDRRuntime \
    AI16NightRuntime \
    AI16PortraitRuntime \
    AI16FaceDetection \
    AI16AnimalDetection \
    AI16SubjectTracking \
    AI16LowLight \
    AI16BestShot \
    AI16DocumentDetection \
    AI16QRVision \
    AI16ShotPlanner \
    AI16ChoreographyEngine \
    AI16SubtitleEngine \
    AI16BeatSync \
    AI16HighlightEngine \
    AI16VideoReframe \
    AI16OfflineVoiceEngine \
    AI16LiveTranscription \
    AI16SpeakerProfiles \
    AI16VoiceEffectsEngine \
    AI16AILockScreen \
    AI16AIAOD \
    AI16AIWidgets \
    AI16GlassUI \
    AI16SmartWidgets \
    AI16SmartSettingsSearch \
    AI16BatteryRuntime \
    AI16ThermalRuntime \
    AI16StorageRuntime \
    AI16RAMRuntime \
    AI16CrashAnalyzer \
    AI16ANRAnalyzer \
    AI16OTAEngine \
    AI16OTAUpdate \
    AI16OTAIntegrity \
    AI16AVBVerifier \
    AI16SlotManager \
    AI16Rollback \
    AI16PostUpdateHealth


# AI16 FINAL SYSTEM FUNCTION PACK
PRODUCT_PACKAGES += \
    AI16DefaultApps \
    AI16PermissionController \
    AI16NotificationPermission \
    AI16SystemCommand \
    AI16TaskScheduler \
    AI16AIResourceManager \
    AI16AIServiceRecovery \
    AI16SafeMode \
    AI16ContactsAI \
    AI16CallLogAI \
    AI16Voicemail \
    AI16RCSAI \
    AI16SMSAI \
    AI16CallerCache \
    AI16CallQualityAI \
    AI16EmergencyCallGuard \
    AI16DualSIMPreferences \
    AI165GDiagnostics \
    AI16WiFiAnalyzer \
    AI16WiFiCalling \
    AI16DNSManager \
    AI16VPNManager \
    AI16NetworkUsage \
    AI16DataLimit \
    AI16BatteryCycles \
    AI16ChargingTemperature \
    AI16CPUManager \
    AI16GPUMonitor \
    AI16SensorDiagnostics \
    AI16USBDiagnostics \
    AI16CameraDiagnostics \
    AI16DisplayDiagnostics \
    AI16CameraMicIndicator \
    AI16ClipboardHistory \
    AI16LocationHistory \
    AI16PermissionAutoReset \
    AI16PrivacyReport \
    AI16SystemCore \
    AI16AIModelLifecycle \
    AI16AIModelCompatibility \
    AI16AIQuantization \
    AI16AIBackendManager \
    AI16AITaskController \
    AI16AIBatteryBudget \
    AI16AIThermalBudget \
    AI16AIMemoryManager \
    AI16AIDataControl \
    AI16AICloudConsent \
    AI16Camera2Capabilities \
    AI16CameraLensManager \
    AI16CameraExposure \
    AI16CameraFocus \
    AI16RealtimeFace \
    AI16RealtimeTracking \
    AI16DocumentScanner \
    AI16QRScanner \
    AI16DuplicateDetector \
    AI16SimilarPhotoEngine \
    AI16AIEditPipeline \
    AI16VideoHighlightPipeline \
    AI16CreatorProjects \
    AI16TimelineEditor \
    AI16SceneDatabase \
    AI16ShotDatabase \
    AI16CharacterDatabase \
    AI16ContinuityDatabase \
    AI16AssetManager \
    AI16SFXManager \
    AI16SubtitleTimeline \
    AI16RenderQueue \
    AI16RenderRecovery \
    AI16ExportProfiles \
    AI16OTADownload \
    AI16OTAHashVerifier \
    AI16OTAAVBVerifier \
    AI16OTAResume \
    AI16OTARecovery \
    AI16OTARollback \
    AI16OTAVerification \
    AI16OTAHistory \
    AI16DynamicPartitionManager \
    AI16SafetyCheckIn \
    AI16SafetyLocation \
    AI16LostDevice \
    AI16RemoteErase \
    AI16USBTheftGuard

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ai16/X6711_RUNTIME_CAPABILITIES.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/ai16/X6711_RUNTIME_CAPABILITIES.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ai16/tools/verify_master_features.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/ai16_verify_features

# AI16ROM master feature registry
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ai16/AI16ROM_MASTER_FEATURES.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/ai16/AI16ROM_MASTER_FEATURES.conf

# AI16ROM CINEMA ENGINE
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ai16/cinema/AI16_CINEMA_FEATURES.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/ai16/AI16_CINEMA_FEATURES.conf
