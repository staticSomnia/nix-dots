{ inputs, ... }: {
  flake.modules.homeManager.nixcord = {
    imports = [
      inputs.nixcord.homeModules.default
    ];

    programs.nixcord = {
      enable = true;
      # discord.vencord.enable = true;
      discord.equicord.enable = true;

      discord.openASAR.enable = false;

      # Theming
      # quickCss = "/* css goes here */";

      config = {
        useQuickCss = true;

        frameless = false;
        transparent = true;

        # enabledThemes = [ "midnight.theme.css" ];

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
            type = 5;
            appId = "1498534242895023";
            appName = "Yume 2kki";
            imageBig = "https://i.imgur.com/K1AbYpa.jpeg";
            imageSmall = "https://i.imgur.com/95QDZG9.gif";
            timestampMode = 2;
          };

          disableCallIdle.enable = true;

          expressionCloner.enable = true;

          fakeNitro = {
            enable = true;
            enableStickerBypass = true;
            enableStreamQualityBypass = true;
            enableEmojiBypass = true;
            transformEmojis = true;
            transformStickers = true;
            transformCompoundSentence = true;
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
  };
}
