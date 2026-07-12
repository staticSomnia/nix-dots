{ config, pkgs, inputs, ... }: {

  imports = [
    inputs.nixcord.nixosModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    user = "somnia";
    # Choose your Discord mod client (enable at most one of these two)
    # discord.vencord.enable = true;
    discord.equicord.enable = true;

    # Theming
    # quickCss = "/* css goes here */";

    config = {
      useQuickCss = true;

      themeLinks = [
        "https://github.com/refact0r/system24/blob/e6f5fad20dd764f6f459895fea6bc674baa061bd/theme/flavors/system24-vencord.theme.css"
      ];

      frameless = false;
      transparent = true;

      plugins = {
        accountPanelServerProfile = {
          enable = true;
          prioritizeServerProfile = true;
        };

        alwaysTrust = {
          enable = true;
          domain = true;
          file = true;
        };

        betterGifPicker.enable = true;

        betterSessions = {
          enable = true;
          backgroundCheck = false;
        };

        callTimer = {
          enable = true;
          format = "stopwatch";
        };

        clearUrls.enable = true;

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

        favoriteEmojiFirst.enable = true;

        favoriteGifSearch = {
          enable = true;
          searchOption = "hostandpath";
        };

        forceOwnerCrown.enable = true;

        friendshipRanks.enable = true;

        gifPaste.enable = true;

        iLoveSpam.enable = true;

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

        moreCommands.enable = true;

        noUnblockToJump.enable = true;

        pauseInvitesForever.enable = true;

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

        youtubeAdblock.enable = true;
      };
    };
  };
}


