import Foundation

enum MockData {
    static let searchShowsSample = try! JSONDecoder().decode(Model.ShowSearchMatches.self, from: searchShowsSampleJsonData)
    static let searchShowsSampleJsonData =
    """
    [
      {
        "score": 17.261711,
        "show": {
          "id": 139,
          "url": "http://www.tvmaze.com/shows/139/girls",
          "name": "Girls",
          "type": "Scripted",
          "language": "English",
          "genres": [
            "Drama",
            "Romance"
          ],
          "status": "Ended",
          "runtime": 30,
          "premiered": "2012-04-15",
          "officialSite": "http://www.hbo.com/girls",
          "schedule": {
            "time": "22:00",
            "days": [
              "Sunday"
            ]
          },
          "rating": {
            "average": 6.9
          },
          "weight": 75,
          "network": {
            "id": 8,
            "name": "HBO",
            "country": {
              "name": "United States",
              "code": "US",
              "timezone": "America/New_York"
            }
          },
          "webChannel": null,
          "externals": {
            "tvrage": 30124,
            "thetvdb": 220411,
            "imdb": "tt1723816"
          },
          "image": {
            "medium": "http://static.tvmaze.com/uploads/images/medium_portrait/31/78286.jpg",
            "original": "http://static.tvmaze.com/uploads/images/original_untouched/31/78286.jpg"
          },
          "summary": "<p>This Emmy winning series is a comic look at the assorted humiliations and rare triumphs of a group of girls in their 20s.</p>",
          "updated": 1577601053,
          "_links": {
            "self": {
              "href": "http://api.tvmaze.com/shows/139"
            },
            "previousepisode": {
              "href": "http://api.tvmaze.com/episodes/1079686"
            }
          }
        }
      },
      {
        "score": 17.261711,
        "show": {
          "id": 140,
          "url": "http://www.tvmaze.com/shows/139/girls",
          "name": "Girls Lols",
          "type": "Scripted",
          "language": "English",
          "genres": [
            "Drama",
            "Romance"
          ],
          "status": "Ended",
          "runtime": 30,
          "premiered": "2012-04-15",
          "officialSite": "http://www.hbo.com/girls",
          "schedule": {
            "time": "22:00",
            "days": [
              "Sunday"
            ]
          },
          "rating": {
            "average": 6.9
          },
          "weight": 75,
          "network": {
            "id": 8,
            "name": "HBO",
            "country": {
              "name": "United States",
              "code": "US",
              "timezone": "America/New_York"
            }
          },
          "webChannel": null,
          "externals": {
            "tvrage": 30124,
            "thetvdb": 220411,
            "imdb": "tt1723816"
          },
          "image": {
            "medium": "http://static.tvmaze.com/uploads/images/medium_portrait/31/78286.jpg",
            "original": "http://static.tvmaze.com/uploads/images/original_untouched/31/78286.jpg"
          },
          "summary": "<p>This Emmy winning series is a comic look at the assorted humiliations and rare triumphs of a group of girls in their 20s.</p>",
          "updated": 1577601053,
          "_links": {
            "self": {
              "href": "http://api.tvmaze.com/shows/139"
            },
            "previousepisode": {
              "href": "http://api.tvmaze.com/episodes/1079686"
            }
          }
        }
      }
    ]
    """.data(using: .utf8)!

    static let episodesSample = try! JSONDecoder().decode(Model.Episodes.self, from: episodesSampleJsonData)
    static let episodesSampleJsonData = #"""
    [
      {
        "id": 1,
        "url": "http://www.tvmaze.com/episodes/1/under-the-dome-1x01-pilot",
        "name": "Pilot",
        "season": 1,
        "number": 1,
        "airdate": "2013-06-24",
        "airtime": "22:00",
        "airstamp": "2013-06-25T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4388.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4388.jpg"
        },
        "summary": "<p>When the residents of Chester's Mill find themselves trapped under a massive transparent dome with no way out, they struggle to survive as resources rapidly dwindle and panic quickly escalates.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/1"
          }
        }
      },
      {
        "id": 2,
        "url": "http://www.tvmaze.com/episodes/2/under-the-dome-1x02-the-fire",
        "name": "The Fire",
        "season": 1,
        "number": 2,
        "airdate": "2013-07-01",
        "airtime": "22:00",
        "airstamp": "2013-07-02T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4389.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4389.jpg"
        },
        "summary": "<p>While the residents of Chester's Mill face the uncertainty of life in the dome, panic is heightened when a house goes up in flames and their fire department is outside of the dome.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/2"
          }
        }
      },
      {
        "id": 3,
        "url": "http://www.tvmaze.com/episodes/3/under-the-dome-1x03-manhunt",
        "name": "Manhunt",
        "season": 1,
        "number": 3,
        "airdate": "2013-07-08",
        "airtime": "22:00",
        "airstamp": "2013-07-09T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4390.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4390.jpg"
        },
        "summary": "<p>When a former deputy goes rogue, Big Jim recruits Barbie to join the manhunt to keep the town safe. Meanwhile, Junior is determined to escape the dome by going underground.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/3"
          }
        }
      },
      {
        "id": 4,
        "url": "http://www.tvmaze.com/episodes/4/under-the-dome-1x04-outbreak",
        "name": "Outbreak",
        "season": 1,
        "number": 4,
        "airdate": "2013-07-15",
        "airtime": "22:00",
        "airstamp": "2013-07-16T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4391.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4391.jpg"
        },
        "summary": "<p>The people of Chester's Mill fall into a state of panic as an outbreak of meningitis strikes their community, threatening their already depleted medical supplies. Meanwhile, Julia continues to search for answers into her husband's disappearance.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/4"
          }
        }
      },
      {
        "id": 5,
        "url": "http://www.tvmaze.com/episodes/5/under-the-dome-1x05-blue-on-blue",
        "name": "Blue on Blue",
        "season": 1,
        "number": 5,
        "airdate": "2013-07-22",
        "airtime": "22:00",
        "airstamp": "2013-07-23T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4392.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4392.jpg"
        },
        "summary": "<p>The Chester's Mill residents receive an unexpected visit from their loved ones on the other side. Meanwhile, the community braces for a threat from outside the Dome.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/5"
          }
        }
      },
      {
        "id": 6,
        "url": "http://www.tvmaze.com/episodes/6/under-the-dome-1x06-the-endless-thirst",
        "name": "The Endless Thirst",
        "season": 1,
        "number": 6,
        "airdate": "2013-07-29",
        "airtime": "22:00",
        "airstamp": "2013-07-30T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4393.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4393.jpg"
        },
        "summary": "<p>When the town begins to run low on water, the residents of Chester's Mill begin to fight for the remaining resources. Meanwhile, Julia discovers a strange connection that two of the town's residents have with the Dome.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/6"
          }
        }
      },
      {
        "id": 7,
        "url": "http://www.tvmaze.com/episodes/7/under-the-dome-1x07-imperfect-circles",
        "name": "Imperfect Circles",
        "season": 1,
        "number": 7,
        "airdate": "2013-08-05",
        "airtime": "22:00",
        "airstamp": "2013-08-06T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4394.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4394.jpg"
        },
        "summary": "<p>Big Jim takes matters into his own hands when he feels his authority slipping away, and the dome displays its power when a life is taken just as a newborn arrives.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/7"
          }
        }
      },
      {
        "id": 8,
        "url": "http://www.tvmaze.com/episodes/8/under-the-dome-1x08-thicker-than-water",
        "name": "Thicker Than Water",
        "season": 1,
        "number": 8,
        "airdate": "2013-08-12",
        "airtime": "22:00",
        "airstamp": "2013-08-13T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4395.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4395.jpg"
        },
        "summary": "<p>Junior stands up to his father and is shattered when he discovers the truth about his mother's past. Meanwhile, Julia learns firsthand the powers of the \"mini dome\".</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/8"
          }
        }
      },
      {
        "id": 9,
        "url": "http://www.tvmaze.com/episodes/9/under-the-dome-1x09-the-fourth-hand",
        "name": "The Fourth Hand",
        "season": 1,
        "number": 9,
        "airdate": "2013-08-19",
        "airtime": "22:00",
        "airstamp": "2013-08-20T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4396.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4396.jpg"
        },
        "summary": "<p>Big Jim and Barbie discover their lives are more intertwined than they knew when a mysterious woman, Maxine, shows up unexpectedly in Chester's Mill.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/9"
          }
        }
      },
      {
        "id": 10,
        "url": "http://www.tvmaze.com/episodes/10/under-the-dome-1x10-let-the-games-begin",
        "name": "Let the Games Begin",
        "season": 1,
        "number": 10,
        "airdate": "2013-08-26",
        "airtime": "22:00",
        "airstamp": "2013-08-27T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4397.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4397.jpg"
        },
        "summary": "<p>Julia uncovers the truth about her husband's disappearance and unravels some of Chester's Mill's darkest secrets. Meanwhile, Maxine shows Barbie how she plans to take control of the town.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/10"
          }
        }
      },
      {
        "id": 11,
        "url": "http://www.tvmaze.com/episodes/11/under-the-dome-1x11-speak-of-the-devil",
        "name": "Speak of the Devil",
        "season": 1,
        "number": 11,
        "airdate": "2013-09-02",
        "airtime": "22:00",
        "airstamp": "2013-09-03T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4398.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4398.jpg"
        },
        "summary": "<p>Big Jim turns the town against Barbie when the truth about his past is revealed. Meanwhile, Maxine makes it personal when she confronts Barbie's closest ally.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/11"
          }
        }
      },
      {
        "id": 12,
        "url": "http://www.tvmaze.com/episodes/12/under-the-dome-1x12-exigent-circumstances",
        "name": "Exigent Circumstances",
        "season": 1,
        "number": 12,
        "airdate": "2013-09-09",
        "airtime": "22:00",
        "airstamp": "2013-09-10T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4399.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4399.jpg"
        },
        "summary": "<p>While the manhunt for Barbie continues, Big Jim gets the residents of Chester's Mill riled up and the town demands justice for all of Barbie's supposed crimes. Meanwhile, Joe and Norrie must find a new hiding place for the mini dome.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/12"
          }
        }
      },
      {
        "id": 13,
        "url": "http://www.tvmaze.com/episodes/13/under-the-dome-1x13-curtains",
        "name": "Curtains",
        "season": 1,
        "number": 13,
        "airdate": "2013-09-16",
        "airtime": "22:00",
        "airstamp": "2013-09-17T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4400.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4400.jpg"
        },
        "summary": "<p>Secrets of the Dome are revealed and Big Jim is determined to put an end to Barbie once and for all. Meanwhile, Junior, Angie, Joe and Norrie discover who the Monarch is after receiving a shocking visit from a familiar face.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/13"
          }
        }
      },
      {
        "id": 14,
        "url": "http://www.tvmaze.com/episodes/14/under-the-dome-2x01-heads-will-roll",
        "name": "Heads Will Roll",
        "season": 2,
        "number": 1,
        "airdate": "2014-06-30",
        "airtime": "22:00",
        "airstamp": "2014-07-01T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10446.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10446.jpg"
        },
        "summary": "<p>Barbie's fate lies in Big Jim's hands, and the Dome presents a new threat when it becomes magnetized. Meanwhile, Julia seeks out the help of a stranger to save the life of a mysterious girl who may hold clues to origin of the Dome.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/14"
          }
        }
      },
      {
        "id": 15,
        "url": "http://www.tvmaze.com/episodes/15/under-the-dome-2x02-infestation",
        "name": "Infestation",
        "season": 2,
        "number": 2,
        "airdate": "2014-07-07",
        "airtime": "22:00",
        "airstamp": "2014-07-08T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10447.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10447.jpg"
        },
        "summary": "<p>Barbie risks his life to help Rebecca save the Chester's Mill food supply when she discovers an infestation of butterfly eggs on the town's crops.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/15"
          }
        }
      },
      {
        "id": 16,
        "url": "http://www.tvmaze.com/episodes/16/under-the-dome-2x03-force-majeure",
        "name": "Force Majeure",
        "season": 2,
        "number": 3,
        "airdate": "2014-07-14",
        "airtime": "22:00",
        "airstamp": "2014-07-15T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10448.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10448.jpg"
        },
        "summary": "<p>When tensions in Chester's Mill continue to rise as resources dwindle, Big Jim holds a census in order to forecast how long the town can continue to exist under the dire conditions. Meanwhile, a rainstorm brings much-needed water until it changes to acid rain, threatening the lives of everyone it touches. Also, Rebecca and Lyle butt heads over the reasons for the dome's existence.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/16"
          }
        }
      },
      {
        "id": 17,
        "url": "http://www.tvmaze.com/episodes/17/under-the-dome-2x04-revelation",
        "name": "Revelation",
        "season": 2,
        "number": 4,
        "airdate": "2014-07-21",
        "airtime": "22:00",
        "airstamp": "2014-07-22T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10449.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10449.jpg"
        },
        "summary": "<p>As conditions in Chester's Mill worsen, Big Jim and Rebecca consider resorting to the extreme measure of population control, which drives a wedge between Barbie and Julia. Meanwhile, clues to Melanie's past and her connection to the Dome are revealed.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/17"
          }
        }
      },
      {
        "id": 18,
        "url": "http://www.tvmaze.com/episodes/18/under-the-dome-2x05-reconciliation",
        "name": "Reconciliation",
        "season": 2,
        "number": 5,
        "airdate": "2014-07-28",
        "airtime": "22:00",
        "airstamp": "2014-07-29T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10450.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10450.jpg"
        },
        "summary": "<p>Julia takes over as the leader of Chester's Mill after the town becomes divided in the wake of Big Jim and Rebecca's plans for population control. Meanwhile, Joe and Norrie help Melanie search for more clues about her identity at the Dome wall.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/18"
          }
        }
      },
      {
        "id": 19,
        "url": "http://www.tvmaze.com/episodes/19/under-the-dome-2x06-in-the-dark",
        "name": "In the Dark",
        "season": 2,
        "number": 6,
        "airdate": "2014-08-04",
        "airtime": "22:00",
        "airstamp": "2014-08-05T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10451.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10451.jpg"
        },
        "summary": "<p>When Barbie and Sam set out to investigate a mysterious tunnel, a cave-in severs their path back to Chester's Mill. Meanwhile, Julia and Big Jim face off in a struggle for power as a dust storm rages in the town.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/19"
          }
        }
      },
      {
        "id": 20,
        "url": "http://www.tvmaze.com/episodes/20/under-the-dome-2x07-going-home",
        "name": "Going Home",
        "season": 2,
        "number": 7,
        "airdate": "2014-08-11",
        "airtime": "22:00",
        "airstamp": "2014-08-12T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10452.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10452.jpg"
        },
        "summary": "<p>When Barbie descends into the unknown abyss in the mysterious tunnel to look for Sam, he discovers a world that is familiar but filled with unanswered questions.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/20"
          }
        }
      },
      {
        "id": 21,
        "url": "http://www.tvmaze.com/episodes/21/under-the-dome-2x08-awakening",
        "name": "Awakening",
        "season": 2,
        "number": 8,
        "airdate": "2014-08-18",
        "airtime": "22:00",
        "airstamp": "2014-08-19T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10453.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10453.jpg"
        },
        "summary": "<p>When Barbie enlists his father's help to reach out to Julia, he realizes that Don may know more about the Dome than he is letting on. Meanwhile, Big Jim appoints himself sheriff of Chester's Mill.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/21"
          }
        }
      },
      {
        "id": 22,
        "url": "http://www.tvmaze.com/episodes/22/under-the-dome-2x09-the-red-door",
        "name": "The Red Door",
        "season": 2,
        "number": 9,
        "airdate": "2014-08-25",
        "airtime": "22:00",
        "airstamp": "2014-08-26T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10454.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10454.jpg"
        },
        "summary": "<p>When Barbie is apprehended by a group of mysterious men, he is relentlessly interrogated about his connection to the Dome. Meanwhile, Big Jim makes a deal that could seal the fate of the residents of Chester's Mill forever.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/22"
          }
        }
      },
      {
        "id": 23,
        "url": "http://www.tvmaze.com/episodes/23/under-the-dome-2x10-the-fall",
        "name": "The Fall",
        "season": 2,
        "number": 10,
        "airdate": "2014-09-01",
        "airtime": "22:00",
        "airstamp": "2014-09-02T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10455.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10455.jpg"
        },
        "summary": "<p>Big Jim finally learns the shocking truth about what really happened to his wife, Pauline, when they are reunited. Meanwhile, climate change poses a new threat to Chester's Mill.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/23"
          }
        }
      },
      {
        "id": 24,
        "url": "http://www.tvmaze.com/episodes/24/under-the-dome-2x11-black-ice",
        "name": "Black Ice",
        "season": 2,
        "number": 11,
        "airdate": "2014-09-08",
        "airtime": "22:00",
        "airstamp": "2014-09-09T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10456.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10456.jpg"
        },
        "summary": "<p>When temperatures begin to plunge, Sam and Rebecca spring into action to try to save the residents of Chester's Mill. Meanwhile, Barbie risks his own life in order to save Julia after a terrible accident.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/24"
          }
        }
      },
      {
        "id": 25,
        "url": "http://www.tvmaze.com/episodes/25/under-the-dome-2x12-turn",
        "name": "Turn",
        "season": 2,
        "number": 12,
        "airdate": "2014-09-15",
        "airtime": "22:00",
        "airstamp": "2014-09-16T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10457.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10457.jpg"
        },
        "summary": "<p>When a new threat from the Dome intensifies, the residents of Chester's Mill find themselves at risk of being crushed to death. Meanwhile, Melanie's health continues to deteriorate as the fate of the egg remains unknown.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/25"
          }
        }
      },
      {
        "id": 26,
        "url": "http://www.tvmaze.com/episodes/26/under-the-dome-2x13-go-now",
        "name": "Go Now",
        "season": 2,
        "number": 13,
        "airdate": "2014-09-22",
        "airtime": "22:00",
        "airstamp": "2014-09-23T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/4/10458.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/4/10458.jpg"
        },
        "summary": "<p>Potential exit from the Dome is revealed just as the walls begin closing in on those trapped in Chester's Mill.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/26"
          }
        }
      },
      {
        "id": 142270,
        "url": "http://www.tvmaze.com/episodes/142270/under-the-dome-3x01-move-on",
        "name": "Move On",
        "season": 3,
        "number": 1,
        "airdate": "2015-06-25",
        "airtime": "21:00",
        "airstamp": "2015-06-26T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/12/31233.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/12/31233.jpg"
        },
        "summary": "<p>Season 3 begins with Chester's Mill residents appearing inside and outside the Dome following an evacuation into the tunnels beneath the town. Meanwhile, the Dome begins to reveal its ultimate agenda; and surprising alliances form as new residents emerge.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/142270"
          }
        }
      },
      {
        "id": 151048,
        "url": "http://www.tvmaze.com/episodes/151048/under-the-dome-3x02-but-im-not",
        "name": "But I'm Not",
        "season": 3,
        "number": 2,
        "airdate": "2015-06-25",
        "airtime": "22:00",
        "airstamp": "2015-06-26T03:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/12/31234.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/12/31234.jpg"
        },
        "summary": "<p>Chester's Mill residents appear inside and outside the Dome following an exit into the tunnels beneath the town. Meanwhile, the Dome begins to reveal its ultimate agenda; and surprising alliances form as new residents emerge.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/151048"
          }
        }
      },
      {
        "id": 151645,
        "url": "http://www.tvmaze.com/episodes/151645/under-the-dome-3x03-redux",
        "name": "Redux",
        "season": 3,
        "number": 3,
        "airdate": "2015-07-02",
        "airtime": "22:00",
        "airstamp": "2015-07-03T03:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/12/31939.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/12/31939.jpg"
        },
        "summary": "<p>The residents of Chester's Mill try to move on with their lives in the aftermath of their mysterious experience in the tunnels beneath town. Meanwhile, Big Jim suspects new residents Christine and Eva are keeping secrets concerning the Dome.</p><p><br><br></p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/151645"
          }
        }
      },
      {
        "id": 153120,
        "url": "http://www.tvmaze.com/episodes/153120/under-the-dome-3x04-the-kinship",
        "name": "The Kinship",
        "season": 3,
        "number": 4,
        "airdate": "2015-07-09",
        "airtime": "22:00",
        "airstamp": "2015-07-10T03:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/12/32457.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/12/32457.jpg"
        },
        "summary": "<p>Urges the townspeople towards specific individuals and projects that remind them of their experience in the tunnels. Also, Julia and Big Jim make shocking discoveries that reveal a new threat within the Dome.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/153120"
          }
        }
      },
      {
        "id": 176889,
        "url": "http://www.tvmaze.com/episodes/176889/under-the-dome-3x05-alaska",
        "name": "Alaska",
        "season": 3,
        "number": 5,
        "airdate": "2015-07-16",
        "airtime": "22:00",
        "airstamp": "2015-07-17T03:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/13/33494.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/13/33494.jpg"
        },
        "summary": "<p>Big Jim and Julia form a tentative alliance to search for proof that will discredit Christine, which leads them to new information about the Dome's capabilities. Meanwhile, when tensions run high in town and threaten Christine's leadership, she puts a plan in play that has deadly consequences.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/176889"
          }
        }
      },
      {
        "id": 176890,
        "url": "http://www.tvmaze.com/episodes/176890/under-the-dome-3x06-caged",
        "name": "Caged",
        "season": 3,
        "number": 6,
        "airdate": "2015-07-23",
        "airtime": "22:00",
        "airstamp": "2015-07-24T03:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/13/34493.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/13/34493.jpg"
        },
        "summary": "<p>For information about her agenda. Also, when Joe and Norrie question the town's new rules, they find themselves in a dangerous face-off with the increasingly unstable residents.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/176890"
          }
        }
      },
      {
        "id": 185048,
        "url": "http://www.tvmaze.com/episodes/185048/under-the-dome-3x07-ejecta",
        "name": "Ejecta",
        "season": 3,
        "number": 7,
        "airdate": "2015-07-30",
        "airtime": "22:00",
        "airstamp": "2015-07-31T03:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/13/34948.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/13/34948.jpg"
        },
        "summary": "<p>As the world outside the Dome is rocked by a catastrophic meteor shower, unexpected alliances form inside the barrier. Eva tries to indoctrinate Barbie deeper into The Kinship and Big Jim and Julia turn to one another while isolated on Bird Island outside of town. Also, Joe is forced to accept help from Sam, the man who killed his sister.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/185048"
          }
        }
      },
      {
        "id": 185049,
        "url": "http://www.tvmaze.com/episodes/185049/under-the-dome-3x08-breaking-point",
        "name": "Breaking Point",
        "season": 3,
        "number": 8,
        "airdate": "2015-08-06",
        "airtime": "22:00",
        "airstamp": "2015-08-07T03:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/14/36036.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/14/36036.jpg"
        },
        "summary": "<p>Who is mobilizing residents to work on a massive excavation project in the caves underneath the town. Also, Hunter uses his tech skills to contact the outside world.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/185049"
          }
        }
      },
      {
        "id": 185050,
        "url": "http://www.tvmaze.com/episodes/185050/under-the-dome-3x09-plan-b",
        "name": "Plan B",
        "season": 3,
        "number": 9,
        "airdate": "2015-08-13",
        "airtime": "22:00",
        "airstamp": "2015-08-14T03:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/14/37358.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/14/37358.jpg"
        },
        "summary": "<p>Control over the town by initiating a life-or-death plot involving Barbie and Eva, while Joe and Norrie conduct research to better understand the Dome's ultimate agenda. Meanwhile, Hunter finds more information about the true head of Aktaion, the nefarious private corporation that wants to harness the Dome's energy.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/185050"
          }
        }
      },
      {
        "id": 185051,
        "url": "http://www.tvmaze.com/episodes/185051/under-the-dome-3x10-legacy",
        "name": "Legacy",
        "season": 3,
        "number": 10,
        "airdate": "2015-08-20",
        "airtime": "22:00",
        "airstamp": "2015-08-21T03:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/15/39057.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/15/39057.jpg"
        },
        "summary": "<p>The nefarious head of Aktaion. Despite Hektor revealing more about the Dome's origins and helping to strike back at it, Big Jim and Julia still worry he will betray them. Meanwhile, Hunter receives encrypted files that give disturbing insights into the final effect the Dome will have on the infected townspeople.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/185051"
          }
        }
      },
      {
        "id": 185052,
        "url": "http://www.tvmaze.com/episodes/185052/under-the-dome-3x11-love-is-a-battlefield",
        "name": "Love is a Battlefield",
        "season": 3,
        "number": 11,
        "airdate": "2015-08-27",
        "airtime": "22:00",
        "airstamp": "2015-08-28T03:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/16/40250.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/16/40250.jpg"
        },
        "summary": "<p>The head of Aktaion, to test a possible cure for infected townspeople. Also, Joe chooses to work with Christine after she shares some shocking information about the entity behind the Dome.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/185052"
          }
        }
      },
      {
        "id": 185053,
        "url": "http://www.tvmaze.com/episodes/185053/under-the-dome-3x12-incandescence",
        "name": "Incandescence",
        "season": 3,
        "number": 12,
        "airdate": "2015-09-03",
        "airtime": "22:00",
        "airstamp": "2015-09-04T03:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/16/41932.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/16/41932.jpg"
        },
        "summary": "<p>Who is adamant that infected townspeople never escape the Dome.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/185053"
          }
        }
      },
      {
        "id": 185054,
        "url": "http://www.tvmaze.com/episodes/185054/under-the-dome-3x13-the-enemy-within",
        "name": "The Enemy Within",
        "season": 3,
        "number": 13,
        "airdate": "2015-09-10",
        "airtime": "22:00",
        "airstamp": "2015-09-11T02:00:00+00:00",
        "runtime": 60,
        "image": {
          "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/17/43622.jpg",
          "original": "http://static.tvmaze.com/uploads/images/original_untouched/17/43622.jpg"
        },
        "summary": "<p>As the Dome in Chester's Mill comes down, the Resistance makes a final attempt to protect the outside world from the infected townspeople in the Kinship and their new queen.</p>",
        "_links": {
          "self": {
            "href": "http://api.tvmaze.com/episodes/185054"
          }
        }
      }
    ]
    """#.data(using: .utf8)!
}
