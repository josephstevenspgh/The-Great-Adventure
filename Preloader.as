package
{
	import Playtomic.*;
	import org.flixel.FlxPreloader
 
	public class Preloader extends FlxPreloader
	{
		public function Preloader():void
		{
			Log.View(3881, "3c268560ffe0481b", root.loaderInfo.loaderURL);
			className = "main";
			super();
		}
	}
}
