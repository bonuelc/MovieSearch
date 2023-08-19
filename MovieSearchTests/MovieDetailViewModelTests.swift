//
//  MovieListViewModelTests.swift
//  MovieSearchTests
//
//  Created by Christopher Bonuel on 8/18/23.
//

@testable import MovieSearch
import XCTest

final class MovieDetailViewModelTests: XCTestCase {
    func testHappyPath() {
        assert(
            sut: .init(movie: .populated()),
            expected: .init()
        )
    }
    
    func testBadDate() {
        assert(
            sut: .init(movie: .populated(releaseDate: "")),
            expected: .init(releaseDateString: "Release Date: Unknown")
        )
    }
}

// MARK: - Definitions

private extension MovieDetailViewModelTests {
    typealias ViewModel = MovieDetailViewModel
    
    struct TestViewModel {
        init(
            imageURL: URL? = URL(string: "https://image.tmdb.org/t/p/original/dummyPath.jpg"),
            titleString: String = "dummyTitle",
            releaseDateString: String = "January 2, 2020",
            ratingTitleString: String = "Viewer Rating",
            ratingDescriptionString: String = "7.3/10",
            rating: Double = 7.26,
            ratingScale: Double = 10,
            overviewTitle: String = "OVERVIEW",
            overviewDescription: String = "dummyOverview"
        ) {
            self.imageURL = imageURL
            self.titleString = titleString
            self.releaseDateString = releaseDateString
            self.ratingTitleString = ratingTitleString
            self.ratingDescriptionString = ratingDescriptionString
            self.rating = rating
            self.ratingScale = ratingScale
            self.overviewTitle = overviewTitle
            self.overviewDescription = overviewDescription
        }
        
        let imageURL: URL?
        let titleString: String
        let releaseDateString: String
        let ratingTitleString: String
        let ratingDescriptionString: String
        let rating: Double
        let ratingScale: Double
        let overviewTitle: String
        let overviewDescription: String
    }
}

// MARK: - Convenience Init

private extension Movie {
    static func populated(
        title: String = "dummyTitle",
        releaseDate: String = "2020-01-02",
        posterPath: String = "/dummyPath.jpg",
        rating: Double = 7.26,
        overview: String = "dummyOverview"
    ) -> Self {
        self.init(
            title: title,
            releaseDate: releaseDate,
            posterPath: posterPath,
            rating: rating,
            overview: overview
        )
    }
}

// MARK: - Assertions

private extension MovieDetailViewModelTests {
    func assert(
        sut: ViewModel,
        expected: TestViewModel,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(
            sut.imageURL,
            expected.imageURL,
            "imageURL should be `\(String(describing: expected.imageURL))`",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            sut.titleString,
            expected.titleString,
            "titleString should be `\(expected.titleString)`",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            sut.releaseDateString,
            expected.releaseDateString,
            "releaseDateString should be `\(expected.releaseDateString)`",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            sut.ratingTitleString,
            expected.ratingTitleString,
            "ratingTitleString should be `\(expected.ratingTitleString)`",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            sut.ratingDescriptionString,
            expected.ratingDescriptionString,
            "ratingDescriptionString should be `\(expected.ratingDescriptionString)`",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            sut.rating,
            expected.rating,
            "rating should be `\(expected.rating)`",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            sut.ratingScale,
            expected.ratingScale,
            "ratingScale should be `\(expected.ratingScale)`",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            sut.overviewTitle,
            expected.overviewTitle,
            "overviewTitle should be `\(expected.overviewTitle)`",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            sut.overviewDescription,
            expected.overviewDescription,
            "overviewDescription should be `\(expected.overviewDescription)`",
            file: file,
            line: line
        )
    }
}
