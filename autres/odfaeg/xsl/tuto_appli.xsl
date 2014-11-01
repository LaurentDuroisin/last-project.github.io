<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="/xsl/structure.xsl"?>
<page>
    <icon>/img/toto.png</icon>
    <menu>/menu.xml</menu>
    <footer>/tonfooter.xml</footer>
    <title>ODFAEG</title>
    <content>
        <fr>
        	<html>
                      <u>Chapitre II : Création d'une application ODFAEG-LIKE.</u>

Définition de l'application : 

Pour créer une application « odfaeg-like » il faut hériter de la classe odfaeg::application. (Créer donc une nouvelle classe et faîtes la hériter de odfaeg::application.)

Si votre application est une application graphique, vous devez appeler le constructeur de la classe parent (celui de la classe odfaeg::Application) en lui passant les paramètres suivants :
sf::VideoMode, std::string (titre de la fenêtre) 
MyAppli(sf::VideoMode wm, std::string title) : Application (wm, title) 

Ensuite vous pouvez redéfinir les méthodes suivantes : 

onLoad() 

Méthode à redéfinir si vous avez des ressources externes à charger.

onInit() 

C'est dans cette méthode que vous créerez et initialiserai tout ce qui doit être initialiser. (Les commandes, les entités graphiques, la définition des collisions, etc...)

onRender(odfaeg::FastRenderComponentManager *frcm)

Dans cette méthode vous pouvez définir ce qui devra être dessiné sur la frame courante en le dessinant sur un composant de rendu ODFAEG. (Le composant de rendu se chargera de rendre vos dessins de la manière la plus optimale suivant les fonctionnalités supportées par votre carte graphique)

Si cette méthode n'est pas redéfinie, ou bien que l'application n'est pas une application graphique, rien n'est dessiné.

onDisplay(odfaeg::RenderWindow *window) 

Cette méthode est à redéfinir si vous devez dessiner des choses directement sur la fenêtre de rendu. 

onUpdate(sf::Event& event)

Dans cette méthode vous pouvez mettre à jour la frame suivante. (Celle-ci sera mise à jour en même temps que le dessin de la frame courante à l'aide d'un thread.)

Ce qui rend le processus de rendu plus rapide. (Si l'application n'est pas une application graphique ou si cette méthode n'est pas redéfinie, rien n'est remis à jour)
Cette méthode prend un paramètre : le dernière événement SFML généré par l'application.

OnExec()

Cette méthode est à redéfinir si votre application ne possède pas de fenêtre, c'est le cas par exemple des applications serveur, mais elle peut aussi être redéfinie si votre application doit effectuer des traitement en fin de boucle.

Création de l'application :

Pour créer une application il suffit d'appeler le constructeur en lui passant les bons paramètres suivant le type d'application  dans le fonction main :

MyAppli app(sf::VideoMode(800, 600), "Test odfaeg");

Le constructeur de la classe odfaeg::application peut prendre des paramètres supplémentaires comme par exemple : 

un booléen qui indique si l'on veut activer le depthtest d'opengl ou non. (par défaut ce boonéen vaut true)

sf::Style : le style de la fenêtre.

sf::ContextSettings : permet de spécifier des options de rendu opengl plus détaillées.

Enfin, pour lancer l'application il suffit d'appeler la méthode exec() de la classe application, celle-ci renvoie un booléen qui indique si l'application a réussi à s'exécuté correctement ou si une erreur s'est produite :

return app.exec() ;

Arrêt de l'application : 

Pour arrêter l'application, il suffit d'appelé la méthode stop dans votre classe qui hérite de application, par exemple, ici, nous voulons arrêter l'application lorsque l'utilisateur ferme la fenêtre :

Nous devons donc rajouter ce code-ci dans la méthode onUpdate :

if (event.type == sf::Event::Closed) {

            stop();
}


Les classes de rendu graphique 2D d'odfaeg sont les même que celle de sfml à l'exception prêt qu'elles se trouvent dans le namepsace odfaeg et non dans le namespace sf. (Par exemple odfaeg::ConvexShape pour les formes convexe)

A la différence de SFML, les objets SFML-LIKE de odfaeg peuvent posséder des points en 3D pour rendre des entité en 2.5D. (C'est à dire des plans par exemple.)

Voilà maintenant vous savez créer des applications odfaeg toutes simple.

		</html>
        </fr>
    </content>
</page>
