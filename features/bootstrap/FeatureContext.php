<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Swaggest\JsonSchema\Schema;

/**
 * Defines application features from the specific context.
 */
class FeatureContext implements Context
{
    /**
     * @var PyStringNode
     */
    private $json;
    /**
     * @var Schema
     */
    private $jsonValidator;

    /**
     * @Given The following JSON:
     */
    public function theFollowingJson(PyStringNode $json)
    {
        $this->json = $json->getRaw();
    }

    /**
     * @When it's validated against :schemaName
     */
    public function itsValidatedAgainst($schemaName)
    {
        $jsonSchemaObject = json_decode(
            file_get_contents(
                realpath($schemaName)
            )
        );

        $this->jsonValidator = Schema::import(
            $jsonSchemaObject
        );
    }

    /**
     * @Then it should pass validation
     */
    public function itShouldPassValidation()
    {
        $this->jsonValidator->in(
            json_decode($this->json)
        );
    }
}
