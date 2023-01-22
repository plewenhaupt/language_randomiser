#################
#   PSEUDOCODE  #
#################
#=
What I want to do is: 
- List all the possible attributes that different word categories and sentences can have. 
- Build a randomiser that outputs a random set of attributes. 


=#

#################
#   ATTRIBUTES  #
#################
# Noun
noun_type = ["abstract", "concrete", "countable", "uncountable"]
noun_gender = ["masculine", "feminine"]
noun_number = ["singular", "plural"]
noun_case = ["nominative", "dative", "accusative", "genitive", "prepositional"]

# Verb
verb_group = ["1", "2", "3"]
verb_mood = ["l'indicatif", "subjonctif", "l'impératif", "le conditionnel"]
verb_tense = ["présent", "imparfait", "passé simple", "passé composé", "futur simple", "plus-que-parfait", "passé antérieur", "futur antérieur", "subjonctif présent", "subjonctif passé", "subjonctif imparfait", "subjonctif plus-que-parfait", "conditionnel présent", "conditionnel passé", "conditionnel passé 2", "l'impératif présent", "l'impératif passé"]

# Generator
noun_count = 4 #rand(1:5)
verb_count = rand(1:ifelse(noun_count == 1, 1, noun_count-1))
sentence_instructions = "Please construct a sentence with " * string(noun_count) * ifelse(noun_count == 1, " noun and ", " nouns and ") * string(verb_count) * ifelse(verb_count == 1, " verb.", " verbs.")

noun_variables = [noun_type, noun_gender, noun_number]
noun_instructions = []
for c in 1:noun_count
    attributes = [rand(x) for x in noun_variables]
    instruction = "Noun " * string(c) * " should be " * join(attributes, ", ", " and ")
    push!(noun_instructions, instruction)
end

verb_variables = [verb_group, verb_mood, verb_tense]
verb_instructions = []
for c in 1:verb_count
    attributes = [rand(x) for x in verb_variables]
    instruction = "Verb " * string(c) * " should be from group " * join(attributes, ", ", " and ")
    push!(verb_instructions, instruction)
end

println(sentence_instructions)
println(join(noun_instructions, ", "))
println(join(verb_instructions, ", "))
instructions = [sentence_instructions, noun_instructions, verb_instructions]

# What do I want to final instructions to look like?
# Challenge: Please construct a sentence...
