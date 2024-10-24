package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;

class SpriteMainMenuState extends MusicBeatState
{
public static var psychEngineVersion:String = '0.6.2'; //This is also used for Discord RPC
 var bg:FlxSprite;
 var storymode:FlxSprite;
 var freeplay:FlxSprite;  
 var mods:FlxSprite;  
 var awards:FlxSprite;  
 var credits:FlxSprite;  
 var options:FlxSprite; 
 var gallery:FlxSprite; 
 var debugKeys:Array<FlxKey>;

 var menuItems: FlxTypedGroup<FlxSprite>;

 override function create()
 {
    bg = new FlxSprite(0,0).loadGraphic(Paths.image("spritemainmenu/bg"));
    bg.antialiasing = FlxG.save.data.antialiasing;
    add(bg);
    
    storymode = new FlxSprite(0,0).loadGraphic(Paths.image("spritemainmenu/storymode"));
    storymode.antialiasing = FlxG.save.data.antialiasing;
    storymode.screenCenter(X);
    storymode.y = 20;
    add(storymode);

    freeplay = new FlxSprite(0,0).loadGraphic(Paths.image("spritemainmenu/freeplay"));
    freeplay.antialiasing = FlxG.save.data.antialiasing;
    freeplay.screenCenter(X);
    freeplay.y = 140;
    add(freeplay);

    mods = new FlxSprite(0,0).loadGraphic(Paths.image("spritemainmenu/mods"));
    mods.antialiasing = FlxG.save.data.antialiasing;
    mods.screenCenter(X);
    mods.y = 260;
    add(mods);
    
    awards = new FlxSprite(0,0).loadGraphic(Paths.image("spritemainmenu/awards"));
    awards.antialiasing = FlxG.save.data.antialiasing;
    awards.screenCenter(X);
    awards.y = 380;
    add(awards);
    
    credits = new FlxSprite(0,0).loadGraphic(Paths.image("spritemainmenu/credits"));
    credits.antialiasing = FlxG.save.data.antialiasing;
    credits.screenCenter(X);
    credits.y = 500;
    add(credits);
    
    options = new FlxSprite(0,0).loadGraphic(Paths.image("spritemainmenu/options"));
    options.antialiasing = FlxG.save.data.antialiasing;
    options.screenCenter(X);
    options.y = 620;
    add(options);

    gallery = new FlxSprite(0,0).loadGraphic(Paths.image("spritemainmenu/gallery"));
    gallery.antialiasing = FlxG.save.data.antialiasing;
    gallery.x = 0;
    gallery.y = 50;
    add(gallery);

    var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
    versionShit.scrollFactor.set();
    versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    add(versionShit);
    var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
    versionShit.scrollFactor.set();
    versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    add(versionShit);

    super.create();
 }
 override function update(elapsed:Float)
 {
    debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));
    FlxG.mouse.visible = true;
    if (FlxG.keys.anyJustPressed(debugKeys))
        {
            MusicBeatState.switchState(new MasterEditorMenu());
        }

    if (controls.BACK)
        {
            FlxG.sound.play(Paths.sound('cancelMenu'));
            MusicBeatState.switchState(new TitleState());
        }

        if (FlxG.mouse.overlaps(storymode))
            {
                if(FlxG.mouse.pressed)
                {
                FlxG.sound.play(Paths.sound('confirmMenu'));
                FlxG.mouse.visible = false;
                MusicBeatState.switchState(new StoryMenuState());
                }
            }

        if (FlxG.mouse.overlaps(freeplay))
            {
                if(FlxG.mouse.pressed)
                {
                FlxG.sound.play(Paths.sound('confirmMenu'));
                FlxG.mouse.visible = false;
                MusicBeatState.switchState(new FreeplayState());
                }
            }
            if (FlxG.mouse.overlaps(mods))
                {
                    if(FlxG.mouse.pressed)
                    {
                    FlxG.sound.play(Paths.sound('confirmMenu'));
                    FlxG.mouse.visible = false;
                    MusicBeatState.switchState(new ModsMenuState());
                    }
                }
    
            if (FlxG.mouse.overlaps(awards))
                {
                    if(FlxG.mouse.pressed)
                    {
                    FlxG.sound.play(Paths.sound('confirmMenu'));
                    FlxG.mouse.visible = false;
                    MusicBeatState.switchState(new AchievementsMenuState());
                    }
                }
        
                if (FlxG.mouse.overlaps(credits))
                    {
                        if(FlxG.mouse.pressed)
                        {
                        FlxG.sound.play(Paths.sound('confirmMenu'));
                        FlxG.mouse.visible = false;
                        MusicBeatState.switchState(new CreditsState());
                        }
                    }
                if (FlxG.mouse.overlaps(options))
                        {
                            if(FlxG.mouse.pressed)
                            {
                            FlxG.sound.play(Paths.sound('confirmMenu'));
                            FlxG.mouse.visible = false;
                            MusicBeatState.switchState(new options.OptionsState());
                            }
                        }
                        if (FlxG.mouse.overlaps(gallery))
                            {
                                if(FlxG.mouse.pressed)
                                {
                                FlxG.sound.play(Paths.sound('confirmMenu'));
                                FlxG.mouse.visible = false;
                                PlayState.SONG = Song.loadFromJson('Gallery', 'Gallery');
                                PlayState.isStoryMode = false;
                                PlayState.storyDifficulty = 0;
                                LoadingState.loadAndSwitchState(new PlayState());
                                }
                            }
}
}