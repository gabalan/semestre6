#!/usr/bin/spython3
import sys
import nltk

nltk.data.path = ['../nltk_data']

from nltk.corpus import stopwords
from nltk.tokenize import sent_tokenize, word_tokenize

message =  sys.argv[1]
message_tokenized = word_tokenize(message)

blacklist = ['mot1','mot2']

phrase_filtre = []
phrase_filtre = [w for w in message_tokenized if not w in blacklist]

if phrase_filtre != message_tokenized:
    sys.exit(0)
else:
    sys.exit(1)

print("test")
#print(exemple_texte)
#print(word_tokenize(exemple_texte))
#stop_wordf = set(stopwords.words("french"))

#print(stopwords.words("french"))

