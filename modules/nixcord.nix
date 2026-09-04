{ config, pkgs, inputs, ... }: {

  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    # discord.vencord.enable = true;
    discord.equicord.enable = true;

    # Theming
    # quickCss = "/* css goes here */";

    config = {
      useQuickCss = true;

      frameless = false;
      transparent = true;

      enabledThemes = [ "midnight.theme.css"];

      plugins = {
        accountPanelServerProfile = {
          enable = true;
          prioritizeServerProfile = true;
        };

        betterSessions = {
          enable = true;
          backgroundCheck = false;
        };

        callTimer = {
          enable = true;
          format = "stopwatch";
        };

        customRpc = {
          enable = false;

          type = 0;
          appName = "Yume 2kki";
          detailsUrl = "";
          buttonOneUrl = "https://ynoproject.net/2kki";
          buttonOneText = "";
          timestampMode = 2;
          details = "";
          imageBig = "https://i.imgur.com/K1AbYpa.jpeg";
          imageBigTooltip = "";
          partySize = 0;
          partyMaxSize = 0;
          startTime = 6;
          endTime = 7;
          state = "";
          imageSmall = "https://i.imgur.com/95QDZG9.gif";
          imageBigUrl = "";
          appId = "1498534242895023";
          imageSmallTooltip = "";
        };

        disableCallIdle.enable = true;

        expressionCloner.enable = true;

        fakeNitro = {
          enable = true;
          enableStickerBypass = false;
          enableStreamQualityBypass = true;
          enableEmojiBypass = false;
          transformEmojis = false;
          transformStickers = false;
          transformCompoundSentence = false;
          useHyperLinks = true;
          disableEmbedPermissionCheck = false;
        };

        friendshipRanks.enable = true;

        gifPaste.enable = true;

        memberCount = {
          enable = true;
          memberList = true;
          toolTip = true;
          voiceActivity = true;
        };

        messageLogger = {
          enable = true;
          deleteStyle = "text";
          logDeletes = true;
          collapseDeleted = false;
          logEdits = true;
          inlineEdits = true;
          ignoreBots = false;
          ignoreSelf = true;
          ignoreUsers = "";
          ignoreChannels = "";
          ignoreGuilds = "";
        };

        noUnblockToJump.enable = true;

        permissionFreeWill = {
          enable = true;
          lockout = true;
          onboarding = true;
        };

        permissionsViewer.enable = true;

        platformIndicators = {
          enable = true;
          colorMobileIndicator = true;
          list = true;
          badges = true;
          messages = true;
        };

        relationshipNotifier = {
          enable = true;
          offlineRemovals = true;
          groups = true;
          servers = true;
          friends = true;
          friendRequestCancels = true;
          notices = false;
        };

        serverInfo.enable = true;

        serverListIndicators = {
          enable = true;
          mode = 2;
        };

        showHiddenThings.enable = true;
      };
    };
  };
}
