/* Affiche/Cache la liste et les boutons de tri*/
function AffCacher(liste){

}

/* Tri ascendant et descendant avec animation*/
function tri(el, method) {

};

/* Création et gestion de l'arborescence de fichiers pour le contenu du rendu dans la page d'accueil */
(function($) {
        $.fn.tree = function(settings) {    
            var options = { expand: {} };
            $.extend(options, settings);
                
            return this.each(function(){
                var $$ = $(this).addClass('tree');
                
                // Applique la classe 'file' aux "li" qui n'ont pas d'enfants                
                $('li:not(:has(ul))', $$).addClass('file');

                // Applique la classe 'folder' aux "li" qui ont des enfants
                $('li:has(ul)', $$).addClass('folder');
                
                // Masque tous les "ul" sous les dossiers
                $('.folder ul', $$).hide();
                
                // Affiche/masque le "ul" sous le folder lorsqu'il est cliqué
                // et y  ajoute/supprime la classe "open" puis stoppe la propagation
                // pour que les dossiers supérieurs ne "recoivent pas" le clic
                $('.folder', $$).click(function(e) {
                        $('ul:first', this).slideToggle();                    
                        $(this).toggleClass('open');
                        e.stopPropagation();
                        return false;
                });
                
                // Stoppe la propagation du clic sur les fichiers
                // pour que les dossiers supérieurs ne "recoivent pas" le clic
                // et se ferment
                $('.file', $$).click(function(e) {
                    e.stopPropagation();
                });
                
                // Ouvre les éventuels dossiers (et les dossiers parents)
                // précisés en option                
                $(options.expand, $$).each(function() {    
                        $('ul:first', this).show();    
                        $(this).addClass('open');            
                        $(this).parents('.folder ul').show();
                        $(this).parents('.folder').addClass('open');
                });
                
                // Fonction comptant les enfants et affichant le compteur
                function addCounters() {
                    // Supprime les anciens compteurs
                    $('.counter', $$).remove();    
                    // Ajoute les nouveaux compteurs
                    $('.folder > a', $$).append(function() { 
                        var parent = $(this).parent();
                        var count  = $('.file', parent).size();
                        return ' <span class="counter">('+ count +')</span> '; 
                    });    
                }
                addCounters();
            });
        };
    })(jQuery);
        
    $(function() {
        $('#tree').tree({ expand: '.folder:first' });
    });

