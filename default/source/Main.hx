package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public static var BUILD(get, never):Int;

	public static dynamic function get_BUILD():Int
	{
		return Assets.getFileTextContent('build.txt', false);
	}

	public function new()
	{
		super();

		
		#if (sys && debug)
		var sysPath = Sys.programPath().substring(0, Sys.programPath().indexOf('\\export')).replace('\\', '/');
		sysPath += '/build';

		File.saveContent(sysPath, Std.string(BUILD + 1));

		if (!FileSystem.exists('prev-build')
			|| (FileSystem.exists('prev-build') && (File.getContent('prev-build') != File.getContent('assets/build.txt'))))
		{
			File.saveContent('prev-build', Std.string(BUILD));
			File.saveContent('assets/build.txt', Std.string(BUILD + 1));
		}
		#end

		addChild(new FlxGame(0, 0, PlayState));
	}
}
