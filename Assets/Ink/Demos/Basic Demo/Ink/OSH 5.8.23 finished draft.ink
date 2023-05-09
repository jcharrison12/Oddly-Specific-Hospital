VAR audience = 50
VAR carmella = 50
VAR david = 50
VAR priscilla = 50
VAR priscilla_is_nurse = true
VAR industry = "real estate"
VAR checkpoint1 = false
VAR checkpoint2 = false

Your name is Jonathan and you are the star of the scrappy up-and-coming soap opera, "Oddly Specific Hospital."
* [Continue]
-> memory

=== memory ===
But ever since you hit your head rather hard one day, you've had short term memory loss and you can never remember your lines.
"Remember, we're short on budget so we only get one take, so don't screw it up!" barks the director.
* [Let's go!]
-> scene1

=== scene1 ===
The episode begins. Mr. and Mrs. Harrison check into the hospital. Carmella Harrison is going into labor and you are going to deliver her baby.
"Action!" yells the director.
"Oh, look, there's Dr. G, dear," says Carmella. "Dr. G! I'm ready to have my baby!" She seems remarkably calm for her situation.
* "Mrs. Carmella, good to see you. That's what I like to hear."
->prep
* "Aren't you a bit...early?"
-> premature
* "You sound too excited for someone who's about to split her vagina open."

-> hates_children

=== prep ===
"Excellent! Oh I do hope this baby is an easy one. Would you please show me to my hospital room?
"Absolutely." You guide her to her room in the maternity ward.
* [Continue]
-> husband

=== premature ===
{audience + 5 <=50:
    ~audience = audience + 5
- else:
    ~audience = 50
}
She looks concerned. "I beg your pardon?"

"Well, aren't you only at 33 weeks? That's very premature," you say matter-of-factly.
Angela, Carmella's actress, glares at you. This was probably not what you were supposed to say.

"No, doctor, I'm definitely due."

You grab a random clipboard, pretend to read it, and say, "Oh yes, right, I'm thinking of Carmella...Hendrickson. You're right on time." You chuck the clipboard aside and hit an orderly.

* [Continue] -> prep

=== hates_children ===
{audience - 10 >=0:
    ~audience = audience - 10
- else:
    ~audience = 0
}
Angela, Carmella's actress, looks like you just punched her in the face.
"Excuse me, doctor?"
"You'll probably crap yourself, too. I told you, kids aren't worth it."
Angela stares at you while she tries to stay on script. If looks could kill...

* [Continue]
-> prep

=== husband ===
"Oh, I forgot to get your name, Mr. Harrison," you address Carmella's husband.
"David," he says curtly. You get the impression this character doesn't trust you.
* [Continue] -> nurse_intro

=== nurse_intro ===
Maude, an older actress in her 50s, enters the room. She's wearing scrubs. You don't remember who she is supposed to be, but she has a name tag that says "Priscilla."
"Looks like you're about to pop, dearie. Family is such a blessing," she says in a raspy smoker voice.

* [What if she was a figment of your imagination?] -> figment
* "Carmella and David, this is Nurse Priscilla." -> nurse_priscilla
* "There you are! This is Priscilla, my shadowing med student. She'll be assisting with the delivery." 
-> med_student


=== figment ===
{audience - 10 >= 0:
    ~audience = audience - 10
- else:
    ~audience = 0
}
"Auntie Evelyn??? I thought you were dead?!" you exclaim.
Maude has been on this show for a long time and she's aware of your bullsh--I mean  memory problems. Without skipping a beat she says...
"Dr. G, you should get some water. It's Nurse Priscilla, we've worked together for years. Now, Carmella, dearie, let's get you set up with your epidural."
"This is ridiculous," barks David, whose actor is also named David. "Can I talk to you, doctor, while the nurse handles the drugs?"
You nod.
* [Continue] -> fortune
->END

=== nurse_priscilla ===
"That's me," Priscilla rasps, clearly a smoker. "Let's get you set up with your epidural, dearie."
David, whose actor is also named David, pulls you aside.
* [Continue] -> fortune
->END
=== med_student ===
{audience + 5 <=50:
    ~audience = audience + 5
- else:
    ~audience = 50
}
~priscilla_is_nurse = false
Maude was once an improv comedian, so from time to time she likes to play along with your deviations from the script.
"That's me," Priscilla rasps, clearly a smoker. "I used to be in marketing inventing pyramid schemes, but I wanted a fresh start and a new career so I went to medical school at the ripe old age of 53."
"Whatever, enough of this chatter," barks David. David's actor, coincidentally, is also David.
 * [Continue] -> fortune

=== fortune ===
 "I want to make sure the heir to my fortune is born safely," he says.
  * "Of course, you're the oil tycoon of the Midwest." 
  -> oil
  * "Of course, you're the real estate tycoon of the Midwest."
  -> real_estate
  * "Of course, you're the Crocs for dogs tycoon of the Midwest."
  ->crocs

=== oil ===
{audience - 5 >=0:
    ~audience = audience - 5
- else:
    ~audience = 0
}
~industry = "oil"
"Uh, right! I mean, the oil isn't from here, obviously, but I am! Therefore I am the oil tycoon of the Midwest. The Midwest oil tycoon.
That probably wasn't in the script, but it made enough sense that David doesn't seem to mind.
"And one day," he continues, "the whole fortune will go to little Jimmy."
* [continue] -> contractions
=== real_estate ===
~industry = "real estate"
{audience + 5 <=50:
    ~audience = audience + 5
- else:
    ~audience = 50
}
David clearly was ready to chew the scenery for this scene. He seems relieved that you actually stuck to the script.
"I toiled and toiled since I was 18 to build my empire," he declared. "It started with a few small motels in Detroit. Then I traded those motels for one hotel in downtown Chicago. Ten years later, I owned more hotels and condominium short-term rentals than anyone in Illinois, Michigan, and Wisconsin combined."
He pauses for dramatic effect.
"And one day, it will all go to little Jimmy."
* [Continue] -> contractions
=== crocs ===
~industry = "dog fashion"
{audience + 10 <=50:
    ~audience = audience + 10
- else:
    ~audience = 50
}
"Crocs...for...dogs? says David, seemingly stuck.
"Right, you started the first canine fashion empire in the Midwest!" you say, trying to help.
"Uh, yes...I did. Ever since I was a boy, I thought my pets growing up weren't...stylish enough. And whenever the outside pavement burned their little paws, I knew I had to invent a solution. So I grew up to design Crocs! For dogs!"
This was definitely not in the script.
"And one day all that fashion for dogs money will go to little Jimmy," he continues.
* [Continue] -> contractions

=== contractions ===
"I will help bring your son into the world safely, David," you say. "Let's go check on your wife."
Angela is settled in in a hospital bed with a fake needle taped to her back.
"How far apart are your contractions, Carmella?" you ask, because that seems like a doctor-y thing to say.
"About two minutes, doctor" says Angela.
"I think we're almost ready, then," you say.
{audience >= 35:
    ~checkpoint1 = true
}
You sneak a quick look at the director, who looks {checkpoint1: pleased as punch at your performance. You are emboldened to make bigger and better acting choices.} {not checkpoint1: really pissed at your performance. He draws his finger across his throat threateningly. You suddenly feel a lot more nervous than you were before.}
{priscilla_is_nurse: "Nurse Priscilla, please check her dilation," you return mentally to the scene.}
{priscilla_is_nurse: "There's something wrong, doctor," she says.}
{not priscilla_is_nurse: "Priscilla, I'm going to show you how to check the diameter of her dilation," you say, back in the scene. "See that, it's at ten centimeters."}
{not priscilla_is_nurse: Maude acts concerned. "Doctor, look, I think something's wrong."}
* ["Great Scott, the baby isn't even human!"]
-> human
* ["Great Scott, David isn't the father!"]
-> paternity
* {checkpoint1}["Great Scott, you're having triplets!"]
-> triplets
* {not checkpoint1}[Trip over a sound cable]
-> trip

=== human ===
You take a prop stethoscope and listen to Carmella's belly.
"Great Scott!" you exclaim. "The heartbeat is spelling out in Morse code, V-A-M-P-I-R-E. The baby isn't human!"
"No!" cries David. "What do we do, doctor?"
* [Make a cross out of two Q-tips]-> cross
* "There's nothing we can do until it's out of the womb. Then we take him out."
->birth_vampire
=== paternity ===
You look between Carmella's legs.
"Great Scott, it's starting to crown! But wait, the baby has shockingly red hair while David has brown hair, so according to the rules of genetics, David is NOT THE FATHER!"
"Impossible!" cries David. "That is my child and the heir to my {industry} empire!"
"Doctor," says Priscilla/Maude, "if David isn't the father, then who is?"
* [Ask Carmella]
-> carmella_confession
* [Artificial insemination]
-> artificial_insem
* {not checkpoint1} [Get stage fright]
-> stage_fright
* {checkpoint1} [Deliver a grand soliloquy]
-> soliloquy
=== triplets ===
{audience - 10 >= 0:
    ~audience = audience - 10
- else:
    ~audience = 0
}
You take a prop stethoscope and listen to Carmella's belly.
"Great Scott!" you exclaim. "There are three heartbeats in there! Triplets! How did we miss this? We're going to have to do an emergency C-section."
The director is waving his arms around at you off to the side. It occurs to you that you don't have a set for a C-section operation. Try that again.
* [Continue] ->contractions
->END
=== trip ===
{audience - 10 >= 0:
    ~audience = audience - 10
- else:
    ~audience = 0
}
"Great Scoooooott," you exclaim while tripping over a sound cable and faceplanting on the ground. Something came unplugged.
"It's starting to *scruncheerrshhh*!" you continue. "But wait, the baby has *brshhheeeeek* while *thwack* has *ayeeeeesshersh*, so according to the rules of genetics, *eeeeeeee* is NOT THE FATHER!"
"Impossible!" cries David. "That is *screeeeeeeeech* and the heir to *ssshshhhhshhh* empire!"
"Doctor," says Priscilla/Maude, "*breeeeeeeeeeeeek*, then who is?"
* [Ask Carmella]
-> carmella_confession
* [Artificial insemination]
-> END
* {not checkpoint1} [Get stage fright]
-> stage_fright_noise
->END
=== artificial_insem ===
{audience + 5 <=50:
    ~audience = audience + 5
- else:
    ~audience = 50
}
"According to doctor/patient confidentiality, I shouldn't say, but given the circumstances...Carmella was artificially inseminated," you confess.
"With whose sperm?" shouts David. "I demand to know."
"{industry=="dog fashion":Jermaine Shepard}{industry=="oil":John D. Rockefeller the Fifth}{industry=="real estate":Richard Hilton}. He's a better {industry} magnate than you. You're weak, David, so I'm not giving you a child."
"You bitch!" screams David. "I'm gonna kill you and your kid."
* [Continue] -> priscilla_cop
=== carmella_confession ===
{audience + 5 <=50:
    ~audience = audience + 5
- else:
    ~audience = 50
}
"Indeed. Carmella? Care to enlighten us?" you ask Angela pointedly.
"David," she says. "I don't love you, and I never have. All you care about is {industry}. Jimmy's real father is...Dr. G! We made love by the pool the night you sold the {industry=="dog fashion": Labradoodle line}{industry=="oil": Saudi Arabia deal}{industry=="real estate": Indianapolis Hilton block}.
"You come into my house, and screw my wife?!" screams David. "I'll make you pay. Fight me you bastard!"
* [Continue] ->priscilla_cop
-> END
=== soliloquy ===
{audience + 10 <=50:
    ~audience = audience + 10
- else:
    ~audience = 50
}
"It was ME!" you exclaim. "Twas I who impregnated Carmella! Under the cover of darkness, we made passionate love under the stars on the grounds of the Harrison estate. Sweet, sweet Carmella was wasting away with the miserly David, who cares only for MONEY, not passion!"
The other three actors are stunned silent for a moment.
"Uh, while I am surprised he admitted it so early," says Carmella, "Dr. G is right. He is the father."
*[Continue]->fight
=== stage_fright ===
{audience - 10 >= 0:
    ~audience = audience - 10
- else:
    ~audience = 0
}
"Um. Uhhhhh. Well. Um. Tomorrow and tomorrow and tomorrow. Life's but a walking shadow with a poor player and... stuff."
Your co-stars look at you expectantly.
* You remember how to act again.
-> carmella_confession
=== carmella_confession_noise ===
"Indeed. Carmella? Care to *eeeeeeeeeeeeek*?" you ask Angela pointedly.
-> END
=== stage_fright_noise ===
"Um. Uhhhhh. Well. Um. *EEEEEEeeeeeeeeeeeeeeerrrrrrrk."
Someone plugs the cable back in. At least no one could hear you forget acting.
* You remember how to act again.
-> carmella_confession
=== fight ===
"You come into my house, and screw my wife?!" screams David. "I'll make you pay. Fight me you bastard!"
"No!" yells Carmella. "He's right, you hadn't made love to me in months then! You don't care about me, you're a slave to the {industry} industry."
"What did you say to me, bitch?" threatens David.
* [Continue] -> priscilla_cop
=== priscilla_cop ===
"Enough!" yells Priscilla. "I'll put an end to this. You may know me as {priscilla_is_nurse: Nurse Priscilla}{not priscilla_is_nurse: Priscilla the medical student}, but I am actually an undercover police officer, and David Harrison is under arrest for embezzlement and fraud in the {industry} sector!" She puts cuffs on David's hands and leads him off the set.
*{not artificial_insem}[Tell Carmella to push as her doctor.]->push_doctor
*{not artificial_insem}[Tell Carmella to push as her lover.]->push_lover
*{artificial_insem}[Tell Carmella to push.] ->push_doctor
*{artificial_insem}[Ask if Carmella wants to FaceTime the father.] ->facetime
=== facetime ===
"Carmella, do you want to call {industry=="dog fashion":Jermaine Shepard}{industry=="oil":John D. Rockefeller the Fifth}{industry=="real estate":Richard Hilton}? You don't have to do this alone," you say.
"It's mostly a business arrangement, but I'm sure he'll want to know his baby is healthy." You FaceTime {industry=="dog fashion":Jermaine Shepard}{industry=="oil":John D. Rockefeller the Fifth}{industry=="real estate":Richard Hilton} while Carmella pushes.
"Wah wah!" cries the newly born infant.
* "I love to see a happy family," you end. 
{audience > 25: -> good_end}
{audience <= 25: -> bad_end}
* "Gross." -> gross
=== gross ===
You walk off the set.
{audience > 25: -> good_end}
{audience <= 25: -> bad_end}
->END
=== push_doctor ===
"Oh Great Scott what kind of doctor am I to be this easily distracted! We've gotta get that baby out of there, so PUSH Carmella!" you exclaim.
->newborn
=== push_lover ===
{audience + 5 <=50:
    ~audience = audience + 5
- else:
    ~audience = 50
}
"Well, darling, now that all those interruptions are gone, I'd love to meet my child, so PUSH Carmella PUSH!" you exclaim.
->newborn

=== newborn ===
"Wah wah!" cries the newly born infant.
"He's beautiful," croons Carmella. "I still like Jimmy, but he's not a Harrison anymore. What's his new last name?"
* "Godfrey." 
-> godfrey
* "Griffin."
-> griffin
* "Golfeschlegelsteinhausenbergerdorff."
-> excuse_me

=== godfrey ===
"James Godfrey. I like it."
{audience > 25: -> good_end}
{audience <= 25: -> bad_end}

=== griffin ===
"James Griffin. I like it."
{audience > 25: -> good_end}
{audience <= 25: -> bad_end}

=== excuse_me ===
{audience - 5 >=0:
    ~audience = audience - 5
- else:
    ~audience = 0
}
"I beg your pardon?"
"Why do you think they call me Dr. G?"
{audience > 25: -> good_end}
{audience <= 25: -> bad_end}
=== cross ===
{audience - 10 >=0:
    ~audience = audience - 10
- else:
    ~audience = 0
}
You hold up a cross of Q-tips to Carmella's vagina.
"Ahhhhhhhhhhhhhh!" screams Angela, who somehow surreptitiously unstraps her pregnancy belly.
"No!" cries David. "I never got to know my son. He was replaced by a monster."
"We will mourn him together, dear," says Carmella.
"I know what will help you heal from this loss," you say.
* {audience > 25} [MUSICAL ENDING]
-> good_vampire_musical
* {audience <= 25} [MUSICAL ENDING]
-> bad_vampire_musical
* [Anti-depressant commercial]
->antidepressant
=== good_vampire_musical ===
{audience + 5 <=50:
    ~audience = audience + 5
- else:
    ~audience = 50
}
"Goodbye, Carmella's baby," you sing in a velvety voice.
"We will mourn you all of our days," the others harmonize with you.
{audience > 25: -> good_end}
{audience <= 25: -> bad_end}
=== bad_vampire_musical ===
{audience - 5 >=0:
    ~audience = audience - 5
- else:
    ~audience = 0
}
"Goodbye, Carmella's baby," you sing with a cracking voice. "We will mourn you all of our days." None of your co-actors join you.
{audience > 25: -> good_end}
{audience <= 25: -> bad_end}
=== antidepressant ===
{audience - 5 >=0:
    ~audience = audience - 5
- else:
    ~audience = 0
}
"You must be experience so much grief right now," you continue. "To ease the pain, I can prescribe you Floxupentin." You turn and look directly at the camera. "Floxupentin, the only FDA-approved treatment for supernaturally-induced depression. May cause side effects such as nausea, vomiting, hallucinations, demonic possession, and shortness of breath. Live your best life and ask your doctor about Floxupentin."
{audience > 25: -> good_end}
{audience <= 25: -> bad_end}

===good_end===
"Cut!" cries the director. "We got it! Good work everyone."
->END
===bad_end===
"Cut!" cries the director. "That was...terrible, but we'll have to run with it. We'll try to clean it up in post."
->END
=== birth_vampire ===
{audience + 5 <=50:
    ~audience = audience + 5
- else:
    ~audience = 50
}
"I can help with that," says Priscilla.
"How?" says Carmella incredulously.
"Because," Priscilla replies, "I'm not actually a {priscilla_is_nurse: nurse}{not priscilla_is_nurse: medical student}. I'm a cop. A supernatural cop. And I've got stakes." She tears a chunk of wood off the set dressing.
"Right. Priscilla, get ready to stake the second I deliver it," you instruct. "And everyone, don't let it bite you or you'll turn. Finally, Carmella, PUSH."
Carmella screams. You toss a baby doll to Priscilla who impales it with her piece of wood.
"Now that that's done, we've got to take care of the bigger problem," says Priscilla. "The adult vampire in the room. David Harrison, you're under arrest for crimes against the living." 
"Damn you! I would've feasted on my wife's blood once my spawn was born if it weren't for you meddling medical professionals."
There's a fight scene that would have been epic if Maude and David weren't making up their choreography on the spot. David runs off set.
Carmella cries. "My baby. Gone."
"I know what will help you heal from this loss," you say.
* {audience > 25} [MUSICAL ENDING]
-> good_vampire_musical
* {audience <= 25} [MUSICAL ENDING]
-> bad_vampire_musical
* [Anti-depressant commercial]
->antidepressant

