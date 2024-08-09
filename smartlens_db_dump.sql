-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ago 06, 2024 alle 15:09
-- Versione del server: 10.4.22-MariaDB
-- Versione PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartlens`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `artworks`
--

DROP TABLE IF EXISTS `details`;
DROP TABLE IF EXISTS `artworks`;
CREATE TABLE `artworks` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT '-',
  `author` varchar(100) DEFAULT '-',
  `imgsrc` varchar(200) DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `artworks`
--

INSERT INTO `artworks` (`id`, `title`, `author`, `imgsrc`) VALUES
(1, 'Venere', 'Sandro Botticelli', './images/Venere_botticelli.jpg'),
(2, 'I duchi di Urbino Federico da Montefeltro e Battista Sforza', 'Piero Della Francesca', './images/Duchi_Urbino.jpg'),
(3, 'Annunciazione', 'Leonardo da Vinci', './images/Annunciazione.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `details`
--
CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT '-',
  `artwork` int(11) NOT NULL,
  `imgsrc` varchar(200) DEFAULT NULL,
  `confidence` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `details`
--

INSERT INTO `details` (`id`, `title`, `artwork`, `imgsrc`, `confidence`) VALUES
(1, 'Venere', 1, './images/VenereDet.jpg', 0.8),
(2, 'Zefiro', 1, './images/ZefiroDet.jpg', 0.65),
(3, 'Ora', 1, './images/OraDet.jpg', 0.7),
(4, 'Battista Sforza', 2, './images/Battista.jpg', 0.8),
(5, 'Federico da Montefeltro', 2, './images/daMontefeltro.jpg', 0.9),
(6, 'Arcangelo Gabriele', 3, './images/Arcangelo.jpg', 0.7),
(7, 'Maria', 3, './images/Maria.jpg', 0.7);

-- --------------------------------------------------------

--
-- Struttura della tabella `language`
--


DROP TABLE IF EXISTS `language_mapping`;
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `data` text,
  `language` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `language`
--

INSERT INTO `language` (`id`, `data`, `language`) VALUES
(1, 'Nota come “Nascita di Venere”, la composizione raffigura più precisamente l’approdo sull’isola di Cipro della dea dell’amore e della bellezza, nata dalla spuma del mare e sospinta dai venti Zefiro e, forse, Aura. La dea è in piedi sopra la valva di una conchiglia, pura e perfetta come una perla. L’accoglie una giovane donna, identificata talvolta con una delle Grazie oppure con l’Ora della primavera, che le porge un manto cosparso di fiori; alla stagione primaverile rimandano anche le rose portate dai venti. Il tema del dipinto, che celebra Venere come simbolo di amore e bellezza, fu forse suggerito dal poeta Agnolo Poliziano.E’ molto probabile che il committente dell’opera sia da ricercarsi all’interno della casata dei Medici, sebbene non si abbiano notizie del dipinto prima del 1550, quando Giorgio Vasari lo descrive nella villa medicea di Castello, proprietà del ramo cadetto della famiglia Medici fin dalla metà del XV secolo. Avvalora questa ipotesi anche la raffigurazione degli alberi di aranci, considerati un emblema mediceo per l’assonanza fra il nome della famiglia e quello con cui queste piante erano note, ‘mala medica’.Diversamente dalla “Primavera”, dipinto su tavola, la “Nascita di Venere” fu realizzato su tela, un supporto non di rado impiegato nel Quattrocento per pitture decorative destinate alle residenze signorili.Botticelli prende ispirazione da statue di epoca classica per l’atteggiamento pudico di Venere, che copre la nudità con i lunghi capelli biondi, i cui riflessi di luce sono ottenuti tramite l’applicazione di oro; anche la coppia dei Venti che vola abbracciata è una citazione da un’opera antica, una gemma di età ellenistica posseduta da Lorenzo il Magnifico.', 'it'),
(2, 'Known as \"Birth of Venus\", the composition more precisely depicts the landing on the island of Cyprus of the goddess of love and beauty, born from the foam of the sea and driven by the winds Zephyr and, perhaps, Aura. The goddess is standing above the shell of a shell, pure and perfect like a pearl. She is welcomed by a young woman, sometimes identified with one of the Graces or with the Hour of Spring, who hands her a mantle strewn with flowers; The roses brought by the winds also refer to the spring season. The theme of the painting, which celebrates Venus as a symbol of love and beauty, was perhaps suggested by the poet Agnolo Poliziano.\r\n\r\nIt is very likely that the commissioner of the work is to be found within the Medici family, although there is no news of the painting before 1550, when Giorgio Vasari describes it in the Medici villa of Castello, property of the cadet branch of the Medici family since the mid-15th century. This hypothesis is also supported by the depiction of orange trees, considered a Medici emblem due to the assonance between the family name and the one by which these plants were known, \'mala medica\'.\r\n\r\nUnlike the \"Spring\", painted on wood, the \"Birth of Venus\" was created on canvas, a support not infrequently used in the fifteenth century for decorative paintings intended for noble residences.\r\n\r\nBotticelli takes inspiration from statues of the classical era for the modest attitude of Venus, who covers her nakedness with her long blond hair, whose light reflections are obtained through the application of gold; even the couple of the Winds flying in an embrace is a quote from an ancient work, a gem from the Hellenistic age owned by Lorenzo the Magnificent.', 'en'),
(3, 'Fra i più celebri ritratti del Rinascimento italiano, il dittico raffigura i signori di Urbino, Federico da Montefeltro (1422-1482) e sua moglie Battista Sforza (1446-1472). In accordo con la tradizione quattrocentesca, ispirata alla numismatica antica, le due figure sono rappresentate di profilo, taglio che garantiva una notevole verosimiglianza e precisione nella resa dei particolari, senza che trasparissero gli stati d’animo: i duchi di Urbino appaiono infatti immuni da turbamenti e emozioni. I coniugi sono affrontati e l’unità spaziale è suggerita dalla luce e dalla continuità del paesaggio collinare sullo sfondo – il paesaggio marchigiano su cui i Montefeltro regnavano. Spicca il contrasto cromatico fra l’incarnato abbronzato di Federico e quello chiarissimo di Battista Sforza, pallore che, oltre a rispettare le convenzioni estetiche in voga nel Rinascimento, potrebbe alludere alla precoce scomparsa della duchessa, morta giovanissima nel 1472. Sul retro delle tavole, i duchi sono effigiati mentre vengono portati in trionfo su carri, accompagnati dalla Virtù cristiane; le iscrizioni latine inneggiano ai valori morali della coppia. La presenza delle pitture sul verso induce a ritenere che i due dipinti, ora inseriti in una cornice moderna, potessero costituire in origine un dittico.\r\n\r\nOpera tra le più famose di Piero della Francesca, il doppio ritratto si inserisce nell’ambito di consolidato rapporto fra il pittore e i duchi di Montefeltro, alla cui corte Piero soggiornò ripetutamente, trovandosi a contatto con un ambiente colto, raffinato, che in breve tempo divenne uno dei più importanti centri culturali e artistici italiani. Il maestro concilia la rigorosa impostazione prospettica appresa durante la formazione fiorentina con la lenticolare rappresentazione della natura propria della pittura fiamminga, raggiungendo risultati di straordinaria e ineguagliata originalità.', 'it'),
(4, 'Among the most famous portraits of the Italian Renaissance, the diptych depicts the lords of Urbino, Federico da Montefeltro (1422-1482) and his wife Battista Sforza (1446-1472). In accordance with fifteenth-century tradition, inspired by ancient numismatics, the two figures are represented in profile, a cut that guaranteed considerable verisimilitude and precision in the rendering of details, without their states of mind being apparent: the dukes of Urbino in fact appear immune to disturbances and emotions. The spouses are faced and the spatial unity is suggested by the light and continuity of the hilly landscape in the background - the Marche landscape over which the Montefeltro reigned. The chromatic contrast between Federico\'s tanned complexion and Battista Sforza\'s very light complexion stands out, a pallor which, in addition to respecting the aesthetic conventions in vogue in the Renaissance, could allude to the early death of the duchess, who died very young in 1472. On the back of the plates, the dukes are portrayed while they are carried in triumph on chariots, accompanied by the Christian Virtues; the Latin inscriptions praise the couple\'s moral values. The presence of the paintings on the reverse leads us to believe that the two paintings, now placed in a modern frame, could originally have constituted a diptych.\r\n\r\nOne of the most famous works by Piero della Francesca, the double portrait is part of the consolidated relationship between the painter and the dukes of Montefeltro, at whose court Piero stayed repeatedly, finding himself in contact with a cultured, refined environment, which in a short time it became one of the most important Italian cultural and artistic centers. The master reconciles the rigorous perspective approach learned during his Florentine education with the lenticular representation of nature typical of Flemish painting, achieving results of extraordinary and unmatched originality.', 'en'),
(5, 'Davanti ad un palazzo rinascimentale, in un rigoglioso giardino recintato che evoca l’hortus conclusus allusivo alla purezza di Maria, l’Arcangelo Gabriele si inginocchia davanti alla Vergine rivolgendole il saluto ed offrendole un giglio. La Vergine risponde, seduta con grande dignità davanti a un leggio sul quale è poggiato un libro. Il tradizionale tema sacro è collocato da Leonardo in un’ambientazione naturalistica e terrena: l’angelo ha una corporeità concreta, suggerita dall’ombra proiettata sul prato e dalla resa dei panneggi che presuppongono studi dal vero. Anche le sue ali prendono ispirazione da quelle di qualche poderoso rapace. E’ straordinaria la resa della luce crepuscolare che plasma le forme, unifica la scena e fa risaltare le sagome scure degli alberi sul lontano paesaggio dello sfondo, dominato dai toni sfumati cari all’artista. Gli elementi architettonici sono disegnati secondo le regole della prospettiva con punto di fuga centrale, ma alcune anomalie riscontrabili nella figura della Vergine, il cui braccio destro appare eccessivamente lungo, potrebbero rispecchiare precoci ricerche di ottica da parte di Leonardo, che avrebbe tenuto conto del punto di vista laterale (da destra) e ribassato determinato dalla collocazione originale della tavola dipinta, cioè sopra un altare laterale di una chiesa.\r\n\r\nPervenuto agli Uffizi nel 1867 dalla sagrestia della chiesa di San Bartolomeo a Monteoliveto fuori porta San Frediano a Firenze, del dipinto non si conoscono né la collocazione originaria, né la committenza. L’Annunciazione è largamente ritenuta un’opera giovanile di Leonardo da Vinci, eseguita quando il maestro era ancora nella bottega di Andrea del Verrocchio. Imita un’invenzione del Verrocchio la foggia del leggio, ispirata al sarcofago di Piero il Gottoso nella chiesa di San Lorenzo a Firenze.', 'it'),
(6, 'In front of a Renaissance palace, in a lush enclosed garden that evokes the hortus conclusus alluding to the purity of Mary, the Archangel Gabriel kneels before the Virgin, greeting her and offering her a lily. The Virgin responds, sitting with great dignity in front of a lectern on which a book is placed. The traditional sacred theme is placed by Leonardo in a naturalistic and earthly setting: the angel has a concrete corporeity, suggested by the shadow cast on the lawn and by the rendering of the drapery which presupposes studies from life. Even its wings take inspiration from those of some powerful birds of prey. The rendering of the twilight light that shapes the shapes, unifies the scene and makes the dark silhouettes of the trees stand out against the distant landscape in the background, dominated by the nuanced tones dear to the artist, is extraordinary. The architectural elements are drawn according to the rules of perspective with a central vanishing point, but some anomalies found in the figure of the Virgin, whose right arm appears excessively long, could reflect early optical research by Leonardo, who would have taken into account the point of lateral view (from the right) and lowered determined by the original location of the painted panel, i.e. above a side altar of a church.\r\n\r\nHaving arrived at the Uffizi in 1867 from the sacristy of the church of San Bartolomeo in Monteoliveto outside Porta San Frediano in Florence, neither the original location nor the patronage of the painting is known. The Annunciation is widely believed to be an early work by Leonardo da Vinci, executed when the master was still in Andrea del Verrocchio\'s workshop. The shape of the lectern imitates an invention by Verrocchio, inspired by the sarcophagus of Piero il Gouty in the church of San Lorenzo in Florence.', 'en'),
(7, 'Nella Nascita di Venere di Botticelli, la dea appare in tutta la sua grazia. È a figura intera, al centro del dipinto, nuda, con la pelle d’avorio e il corpo attraversato da ombre appena accennate. La mano destra appoggiata al seno con gesto pudìco, la mano sinistra sul pube trattiene una ciocca dei capelli lunghissimi mossi dal vento. La testa leggermente reclinata, l’espressione del volto dolce e mite.\nIn equilibrio è posta sul bordo di una conchiglia che la conduce fino all’approdo sull’isola di Cipro.\nNella stessa figura coesistono moto e quiete: al corpo statuario e alla posa stante fanno da contrappunto i capelli che ondeggiano in mille ciocche dorate, la delicata conchiglia che si muove spinta dal vento e dalle onde diventa un solido appoggio sotto ai suoi piedi.\nIl contrasto con il verde e l’azzurro dello sfondo esalta la sua apparizione.  ', 'it'),
(8, 'In Botticelli\'s Birth of Venus, the goddess appears in all her grace. She is full-figure, in the center of the painting, naked, with ivory skin and her body crossed by barely visible shadows. The right hand rests on the breast with a modest gesture, the left hand on the pubis holds a lock of very long hair blowing in the wind. The head slightly tilted, the expression on the face sweet and gentle.\r\nIn balance it is placed on the edge of a shell that leads it to land on the island of Cyprus.\r\nMotion and stillness coexist in the same figure: the statuesque body and the standing pose are counterpointed by the hair that sways in a thousand golden locks, the delicate shell that moves pushed by the wind and the waves becomes a solid support under his feet.\r\nThe contrast with the green and blue of the background enhances its appearance.', 'en'),
(9, 'Nell’angolo a sinistra della Nascita di Venere di Botticelli due venti dalle sembianze umane volano allacciati l’uno all’altra, le ali spiegate e i pochi panneggi ondeggianti. Soffiano con forza verso la dea lasciandoci intuire la direzione del moto. Sono Zefiro e Aura, un vento fresco e fecondo che si lascia abbracciare da uno tiepido e avvolgente.\r\nIl moto che parte da queste due figure si manifesta nell’increspatura sottile delle onde e nel vortice di fiori che li circonda.  ', 'it'),
(10, 'In the left corner of Botticelli\'s Birth of Venus, two winds with human features fly intertwined with each other, their wings spread and their few drapery billowing. They blow forcefully towards the goddess, leaving us to guess the direction of motion. I am Zephyr and Aura, a fresh and fruitful wind that lets itself be embraced by a warm and enveloping one.\r\nThe motion that starts from these two figures is manifested in the subtle ripple of the waves and in the vortex of flowers that surrounds them.', 'en'),
(11, 'A destra, sulla costa frastagliata dell’isola accorre l’Ora della primavera.\r\nIl suo vestito chiaro, trapuntato di fiordalisi, è stretto in vita da un ramo di rosa. Il mantello rosso che porge alla dea è decorato con primule e rametti di mirto e si gonfia per effetto del soffio che giunge dal lato opposto.       ', 'it'),
(12, 'To the right, on the jagged coast of the island, the Hour of Spring arrives.\r\nHer light dress, quilted with cornflowers, is cinched at the waist by a rose branch. The red cloak that he hands to the goddess is decorated with primroses and sprigs of myrtle and swells due to the breath coming from the opposite side.', 'en'),
(13, 'Il ritratto di Battista ha una colorazione chiara, con la pelle di un candore ceruleo come imponeva l\'etichetta del tempo: una pelle chiara era infatti segno di nobiltà, in contrapposizione all\'abbronzatura dei contadini che dovevano stare all\'aperto. La fronte è altissima, secondo la moda del tempo che imponeva un\'attaccatura molto alta (con i capelli che venivano rasati col fuoco di una candela), e l\'acconciatura elaborata, intessuta di panni e gioielli. Piero, al pari dei fiamminghi, si soffermò sulla brillantezza delle perle e delle gemme, restituendo, grazie all\'uso delle velature a olio, il \"lustro\" (riflesso) peculiare di ciascuna superficie, a seconda del materiale.', 'it'),
(14, 'The portrait of Battista has a light color, with the skin of a cerulean whiteness as the etiquette of the time dictated: a light skin was in fact a sign of nobility, as opposed to the tan of the peasants who had to stay outdoors. The forehead is very high, according to the fashion of the time which required a very high hairline (with hair that was shaved with the fire of a candle), and an elaborate hairstyle, woven with cloths and jewels. Piero, like the Flemings, focused on the brilliance of pearls and gems, restoring, thanks to the use of oil glazes, the peculiar \"lustre\" (reflection) of each surface, depending on the material.', 'en'),
(15, 'Il ritratto di Federico è invece più naturalistico: la sua figura è possente, incorniciata dal forte rosso della veste e della berretta, che isola il profilo, mentre l\'ispida colotta dei capelli accentua gli effetti di massa volumetrica. I capelli sono irsuti, lo sguardo fiero e lontano. Il naso adunco e rotto era una cicatrice ottenuta durante un torneo in cui aveva perduto anche l\'occhio destro: per questo si faceva sempre ritrarre di profilo sinistro. La pelle è dipinta nei minimi particolari con distaccata oggettività, dalle rughe e ai piccoli nei, riprendendo i modi dell\'arte fiamminga. La corte di Federico dopotutto proprio negli anni sessanta del Quattrocento viveva l\'apice del suo splendore, con artisti italiani e fiamminghi che lavoravano fianco a fianco influenzandosi reciprocamente.', 'it'),
(16, 'The portrait of Federico, on the other hand, is more naturalistic: his figure is powerful, framed by the strong red of his robe and hat, which isolates the profile, while the bristly crown of his hair accentuates the effects of volumetric mass. The hair is shaggy, the look proud and distant. The hooked and broken nose was a scar obtained during a tournament in which he also lost his right eye: for this reason he always had himself portrayed in left profile. The skin is painted down to the smallest details with detached objectivity, from wrinkles and small moles, recalling the ways of Flemish art. After all, Frederick\'s court was at the height of its splendor in the 1460s, with Italian and Flemish artists working side by side, influencing each other.', 'en'),
(17, 'L’arcangelo Gabriele è ritratto con la posa classica, ossia al momento dell’atterraggio, con le ali ripiegate. Anziché avere le ali di pavone, il messaggero ha le ali di volatile autentiche. Infine, l’angelo benedice Maria con la mano destra, mentre con la sinistra porge il giglio, simbolo di castità e purezza.', 'it'),
(18, 'The archangel Gabriel is portrayed with the classic pose, i.e. at the moment of landing, with his wings folded. Instead of having peacock wings, the messenger has real bird wings. Finally, the angel blesses Mary with his right hand, while with his left he holds out the lily, a symbol of chastity and purity.', 'en'),
(19, 'La Madonna si trova sotto a un portico, separato dall’Angelo con l’hortus conclusus, che allude al ventre della Vergine. Rispettando la tradizione iconografica cristiana, Maria indossa la veste di colore rosso, poiché simbolo della sua natura divina, e un manto di colore blu, segno della vita celeste. Infine, vediamo che la mano destra è appoggiata sul libro, per impedirne la chiusura, mentre la sinistra è sollevata, come accoglienza della chiamata divina.', 'it'),
(20, 'The Madonna is located under a portico, separated from the Angel with the hortus conclusus, which alludes to the Virgin\'s womb. Respecting the Christian iconographic tradition, Mary wears a red dress, as a symbol of her divine nature, and a blue mantle, a sign of celestial life. Finally, we see that the right hand is resting on the book, to prevent it from closing, while the left is raised, as a welcome to the divine call.', 'en');

-- --------------------------------------------------------

--
-- Struttura della tabella `language_mapping`
--

CREATE TABLE `language_mapping` (
  `id` int(11) NOT NULL,
  `external_id` int(11) NOT NULL,
  `data` int(11) NOT NULL,
  `type` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `language_mapping`
--

INSERT INTO `language_mapping` (`id`, `external_id`, `data`, `type`) VALUES
(1, 1, 1, 'artwork'),
(2, 1, 2, 'artwork'),
(3, 2, 3, 'artwork'),
(4, 2, 4, 'artwork'),
(5, 3, 5, 'artwork'),
(6, 3, 6, 'artwork'),
(7, 1, 7, 'detail'),
(8, 1, 8, 'detail'),
(9, 2, 9, 'detail'),
(10, 2, 10, 'detail'),
(11, 3, 11, 'detail'),
(12, 3, 12, 'detail'),
(13, 4, 13, 'detail'),
(14, 4, 14, 'detail'),
(15, 5, 15, 'detail'),
(16, 5, 16, 'detail'),
(17, 6, 17, 'detail'),
(18, 6, 18, 'detail'),
(19, 7, 19, 'detail'),
(20, 7, 20, 'detail');

-- --------------------------------------------------------

--
-- Struttura della tabella `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `login`
--

INSERT INTO `login` (`id`, `username`, `password`) VALUES
(1, 'utente', '6279886fde090b3038f267098bcca771a6efa946');

-- --------------------------------------------------------

--
-- Struttura della tabella `net_details`
--

DROP TABLE IF EXISTS `net_details`;
CREATE TABLE `net_details` (
  `id` int(11) NOT NULL,
  `id_net` int(11) NOT NULL,
  `confidence` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `net_details`
--

INSERT INTO `net_details` (`id`, `id_net`, `confidence`) VALUES
(1, 1, 0.8),
(2, 2, 0.65),
(3, 3, 0.7),
(4, 4, 0.8),
(5, 5, 0.9),
(6, 6, 0.7),
(7, 7, 0.7);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `artworks`
--
ALTER TABLE `artworks`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_fk` (`artwork`);

--
-- Indici per le tabelle `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `language_mapping`
--
ALTER TABLE `language_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `datafkk` (`data`);

--
-- Indici per le tabelle `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `net_details`
--
ALTER TABLE `net_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `artworks`
--
ALTER TABLE `artworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `language_mapping`
--
ALTER TABLE `language_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;


--
-- AUTO_INCREMENT per la tabella `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `detail_fk` FOREIGN KEY (`artwork`) REFERENCES `artworks` (`id`)
  ON DELETE CASCADE;

--
-- Limiti per la tabella `language_mapping`
--
ALTER TABLE `language_mapping`
  ADD CONSTRAINT `datafkk` FOREIGN KEY (`data`) REFERENCES `language` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
