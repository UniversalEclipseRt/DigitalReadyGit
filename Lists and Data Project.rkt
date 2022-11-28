;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Project 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS002
Project 2 - Lists and Data
Submit on Google Classroom by the end of class.

If a question asks you to make a function,
it must follow the complete design recipe
including a purpose statement, signature
and appropriate tests to recieve full credit

If a question asks you to make a structure,
it must follow the complete design recipe
including a definition, interpretation,
and appropriate examples to recieve full credit
|#

(require 2htdp/batch-io)

#| Question 1
Import the "SpotifyTop100.csv" file into a
list of lists called "SPOTIFY-TOP-100".
|#

(define SPOTIFY-TOP-100 (cdr (read-csv-file "/Users/ryantoledo/Documents/csv_files/SpotifyTop100.csv")))

#| Question 2
Create a new structure called "Song"
that contains an song title,
an artist name, an album title,
a song length (in seconds),
and a number of play.

Create a function that converts the imported
csv data (SPOTIFY-TOP-100) into a list of
Song structures. Save this list of songs
as TOP-100-SONGS.
|#

(define-struct song (song-title artist-name album-title song-length-sec num-of-play))

(define (csv-list list)
  (make-song (first list)
             (second list)
             (third list)
             (fourth list) (string->number (fifth list))))
(define (list-list list)
  (map csv-list list))

(define TOP-100-SONGS(list-list SPOTIFY-TOP-100))

#| Question 3
Sometimes songs can sneak their way
onto the global charts if they get
a lot of plays in a very short
amount of time.

Filter songs out of the list that
have less than 1,000,000 plays.

Save this filtered list as
FILTERED-TOP-100.
|#

(define (song-filter sf)
  (filter (λ (song) (>= (song-num-of-play song) 1000000)) sf))

(define FILTERED-TOP-100 (song-filter TOP-100-SONGS))

#| Question 4
What song in the top 100 has the most plays?

Create a function called "max-plays"
that returns the largest number
of plays out of any song in the list.

Then, create a function called "search-by-plays"
that searches for the song with an exact number of plays
and returns that song struct.

Save the song as MOST-PLAYED-SONG.
|#

(define (max-plays mp)
  (foldr (λ (song base) (max (song-num-of-play song) base)) 0 mp))
  
#| Question 5
Which unique artists have songs in the top 100?

Create a function that converts each song in
FILTERED-TOP-100 to just the name of the artist
to get a list of all artists. This list will have
duplicates, so use the (remove-duplicates)
function to get a list of unique artists.
Save this list as ARTIST-NAMES.
|#
(require racket/list)

(define LIST-OF-ARTISTS
  (remove-duplicates (map (λ (song) (song-artist-name song)) FILTERED-TOP-100)))

#| Question 6
Create a struct called "artist"
that contains the name of an
artist and a list of all their songs.
|#

(define-struct artist (name songs))

#| Question 7
We want to create a database of all artists
on the top 100 and their songs.

Create a helper function called "artist-songs"
that takes in the name of an artist and a list of songs.
This function should return a list of all the
songs that the respective artist created.

Create a second function called "make-artist-list"
that takes in a list of artist names and a list
of songs. Using the (artist-songs) helper function,
convert the list of artist names into a list of
artist structs, each one containing the name of
an artist and all of their songs.
|#

(define (artist-song los lon)
  (filter (λ (song) (string=? (song-artist-name song) los)) lon))



#| Question 8
We want to easily convert artist data into a txt file.

First, create a function called (song-to-string)
that takes in a song structure and converts it to
a string with the following format:

*Song Name* [*Album Name*] - *number of plays* Plays

For example,
Anti-Hero [Midnights] - 127574104 plays

Next create a function called (artist-to-string)
that converts each artist into a string
with the following format:

*Artist Name*
* song data
* song data
...

For example,

Taylor Swift
* Anti-Hero [Midnights] - 127574104 plays
* Lavender Haze [Midnights] - 85962709 plays
* Snow on the Beach ft Lana del Ray [Midnights] - 79926541 plays

HINT: Remember to use the new line character "\n"
to add line breaks
|#

#| Question 9
Create a function called "export-top-100-data"
that creates a summary of the top 100 in a readable .txt
file.

Your summary should start with a title (ex. "Spotify Global Top 100 Data")

It should then list every artist on the top 100
and all of their songs, as in the format defined above.

Save this file as "top100data.txt"
|#

#| BONUS
What other data can you analyze?

What artist has the most plays on the top 100?
What album has the most songs on the top 100?
What artist has the most songs on the top 100?

You will gain bonus points for any other
interesting data analysis question you can
answer *exclusively using Racket*
to calculate the results.
|#
