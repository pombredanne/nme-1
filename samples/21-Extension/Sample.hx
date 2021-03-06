import nme.display.Sprite;
import nme.text.TextField;

class Sample extends Sprite
{
   var url:TextField;
   var go:TextField;

   function new()
   {
      super();
      flash.Lib.current.addChild(this);

      url = new TextField();
      url.text="http://www.haxe.org/";
      url.type = flash.text.TextFieldType.INPUT;
      url.height = 18;
      url.width = 200;
      url.x = 20;
      url.y = 20;
      url.border = true;
      url.borderColor =  0x000000;
      addChild(url);

      go = new TextField();
      go.htmlText = "<font size='18' color='0x00ff00'>GO!</font>";
      go.width = 45;
      go.height = 28;
      go.x = 240;
      go.y = 10;
      go.border = true;
      go.borderColor =  0xff0000;
      go.selectable = false;
      go.addEventListener(flash.events.MouseEvent.CLICK,function(_) { launchWeb(); });
      addChild(go);
   }

   function launchWeb()
   {
      var dest = url.text;
      trace("DEST ========= " + dest);

      var launch:Dynamic = nme.JNI.createStaticMethod("nme.NMEWebView", "nmeCreate", "(Ljava/lang/String;)Landroid/view/View;");
      trace("LAUNCH ========= " + launch);

      if (launch!=null)
         nme.Lib.postUICallback( function() { launch(dest); } );
   }

}

